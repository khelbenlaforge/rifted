$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$PrivateNamesPath = Join-Path $RepoRoot ".private-names"

if (-not (Test-Path -LiteralPath $PrivateNamesPath -PathType Leaf)) {
    throw "Missing required .private-names file at the repository root. Publish aborted."
}

$PrivateNames = Get-Content -LiteralPath $PrivateNamesPath | ForEach-Object {
    $entry = $_.Trim()
    if ($entry -and -not $entry.StartsWith("#")) {
        $entry
    }
}

if (-not $PrivateNames) {
    return
}

function Invoke-GitText {
    param([string[]]$Arguments)

    $StartInfo = [System.Diagnostics.ProcessStartInfo]::new()
    $StartInfo.FileName = 'git'
    $StartInfo.UseShellExecute = $false
    $StartInfo.RedirectStandardOutput = $true
    $StartInfo.RedirectStandardError = $true
    $StartInfo.StandardOutputEncoding = [System.Text.UTF8Encoding]::new($false)

    foreach ($Argument in $Arguments) {
        [void]$StartInfo.ArgumentList.Add($Argument)
    }

    $Process = [System.Diagnostics.Process]::new()
    $Process.StartInfo = $StartInfo
    [void]$Process.Start()
    $Output = $Process.StandardOutput.ReadToEnd()
    $ErrorOutput = $Process.StandardError.ReadToEnd()
    $Process.WaitForExit()

    if ($Process.ExitCode -ne 0) {
        throw "Unable to read staged content for the private-name check. $ErrorOutput"
    }

    return $Output
}

function Add-ViolationsForText {
    param(
        [string]$File,
        [string]$Text,
        [ref]$ViolationList
    )

    foreach ($PrivateName in $PrivateNames) {
        $Pattern = '(?<!\w)' + [regex]::Escape($PrivateName) + '(?!\w)'
        if ($Text -cmatch $Pattern) {
            $prefixLength = [Math]::Min(2, $PrivateName.Length)
            $MaskedName = $PrivateName.Substring(0, $prefixLength) + "... (" + $PrivateName.Length + " chars)"
            $ViolationList.Value += [pscustomobject]@{
                File = $File
                Name = $MaskedName
            }
        }
    }
}

$StagedPathOutput = Invoke-GitText @('-C', $RepoRoot, 'diff', '--cached', '--name-only', '-z', '--', 'content/', 'quartz/static/')
$StagedPaths = $StagedPathOutput.Split([char[]]@([char]0), [System.StringSplitOptions]::RemoveEmptyEntries)
$Violations = @()

foreach ($StagedPath in $StagedPaths) {
    # Paths are protected too; unlike content, they have no structural exemptions.
    Add-ViolationsForText -File $StagedPath -Text $StagedPath -ViolationList ([ref]$Violations)

    $FileDiff = Invoke-GitText @('-C', $RepoRoot, 'diff', '--cached', '--no-color', '--', $StagedPath)
    $InHunk = $false

    foreach ($DiffLine in ($FileDiff -split "`n")) {
        if (-not $InHunk) {
            if ($DiffLine.StartsWith('@@')) {
                $InHunk = $true
            }
            continue
        }

        if (-not $DiffLine.StartsWith('+')) {
            continue
        }

        # This is after a hunk marker, so even content beginning with "+++" is an added line.
        $AddedLine = $DiffLine.Substring(1)

        Add-ViolationsForText -File $StagedPath -Text $AddedLine -ViolationList ([ref]$Violations)
    }
}

if ($Violations.Count -gt 0) {
    $Files = ($Violations | Select-Object -ExpandProperty File -Unique) -join ', '
    $Names = ($Violations | Select-Object -ExpandProperty Name -Unique) -join ', '
    & git -C $RepoRoot restore --staged -- content/ quartz/static/
    if ($LASTEXITCODE -ne 0) {
        throw "Private-name publish gate found protected matches, but could not unstage staged content in content/ and quartz/static/."
    }
    throw "Private-name publish gate blocked staged additions in: $Files. Protected match(es): $Names"
}
