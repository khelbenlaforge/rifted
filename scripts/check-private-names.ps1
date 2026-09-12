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

$Diff = & git -C $RepoRoot diff --cached --no-color -- content/ quartz/static/
if ($LASTEXITCODE -ne 0) {
    throw "Unable to read staged content for the private-name check."
}

$CurrentFile = $null
$Violations = @()

foreach ($DiffLine in $Diff) {
    if ($DiffLine -cmatch '^\+\+\+ b/(.+)$') {
        $CurrentFile = $Matches[1]
        continue
    }

    if ($DiffLine -cnotmatch '^\+(?!\+\+)') {
        continue
    }

    if (-not $CurrentFile) {
        continue
    }

    $AddedLine = $DiffLine.Substring(1)

    if ($AddedLine -cmatch '^>\s*\|\s*\*\*Player\*\*\s*\|.*\|\s*$' -or
        $AddedLine -cmatch '^Player::\s*.+$') {
        continue
    }

    # Keep the PC wikilink visible, but exempt its immediately following session-note parenthetical.
    $LineToCheck = $AddedLine -creplace '(?<=\]\])\s*\([^)]*\)', ''

    foreach ($PrivateName in $PrivateNames) {
        $Pattern = '(?<!\w)' + [regex]::Escape($PrivateName) + '(?!\w)'
        if ($LineToCheck -cmatch $Pattern) {
            $prefixLength = [Math]::Min(2, $PrivateName.Length)
            $MaskedName = $PrivateName.Substring(0, $prefixLength) + "... (" + $PrivateName.Length + " chars)"
            $Violations += [pscustomobject]@{
                File = $CurrentFile
                Name = $MaskedName
            }
        }
    }
}

if ($Violations.Count -gt 0) {
    $Files = ($Violations | Select-Object -ExpandProperty File -Unique) -join ', '
    $Names = ($Violations | Select-Object -ExpandProperty Name -Unique) -join ', '
    throw "Private-name publish gate blocked staged additions in: $Files. Protected match(es): $Names"
}
