[CmdletBinding()]
param(
    [switch]$SweepOnly,
    [string]$AttachmentsPath
)

$ErrorActionPreference = "Stop"

function Get-UInt16At {
    param([byte[]]$Bytes, [int]$Offset, [bool]$LittleEndian)
    if ($Offset -lt 0 -or ($Offset + 2) -gt $Bytes.Length) { return $null }
    if ($LittleEndian) { return [int]$Bytes[$Offset] + ([int]$Bytes[$Offset + 1] -shl 8) }
    return ([int]$Bytes[$Offset] -shl 8) + [int]$Bytes[$Offset + 1]
}

function Test-ByteSequence {
    param([byte[]]$Bytes, [int]$Offset, [byte[]]$Expected)
    if ($Offset -lt 0 -or ($Offset + $Expected.Length) -gt $Bytes.Length) { return $false }
    for ($index = 0; $index -lt $Expected.Length; $index++) {
        if ($Bytes[$Offset + $index] -ne $Expected[$index]) { return $false }
    }
    return $true
}

function Get-UInt32At {
    param([byte[]]$Bytes, [int]$Offset, [bool]$LittleEndian)
    if ($Offset -lt 0 -or ($Offset + 4) -gt $Bytes.Length) { return $null }
    if ($LittleEndian) {
        return [uint64]$Bytes[$Offset] + ([uint64]$Bytes[$Offset + 1] -shl 8) + ([uint64]$Bytes[$Offset + 2] -shl 16) + ([uint64]$Bytes[$Offset + 3] -shl 24)
    }
    return ([uint64]$Bytes[$Offset] -shl 24) + ([uint64]$Bytes[$Offset + 1] -shl 16) + ([uint64]$Bytes[$Offset + 2] -shl 8) + [uint64]$Bytes[$Offset + 3]
}

function Get-PngKeyword {
    param([byte[]]$Bytes, [int]$Offset, [int]$Length)
    $end = [Math]::Min($Bytes.Length, $Offset + $Length)
    for ($index = $Offset; $index -lt $end; $index++) {
        if ($Bytes[$index] -eq 0) {
            return [System.Text.Encoding]::Latin1.GetString($Bytes, $Offset, $index - $Offset)
        }
    }
    return "(no keyword terminator)"
}

function Get-TiffFindings {
    param([byte[]]$Bytes, [int]$TiffOffset, [int]$TiffLength, [string]$Source)

    $findings = @()
    $limit = [Math]::Min($Bytes.Length, $TiffOffset + $TiffLength)
    if ($TiffOffset -lt 0 -or ($TiffOffset + 8) -gt $limit) {
        return @("$Source EXIF present, tag-level parsing inconclusive (TIFF header is truncated).")
    }

    $order = [System.Text.Encoding]::ASCII.GetString($Bytes, $TiffOffset, 2)
    if ($order -ne "II" -and $order -ne "MM") {
        return @("$Source EXIF present, tag-level parsing inconclusive (unrecognised TIFF byte order).")
    }
    $littleEndian = $order -eq "II"
    $magic = Get-UInt16At $Bytes ($TiffOffset + 2) $littleEndian
    $ifdRelativeOffset = Get-UInt32At $Bytes ($TiffOffset + 4) $littleEndian
    if ($magic -ne 42 -or $null -eq $ifdRelativeOffset) {
        return @("$Source EXIF present, tag-level parsing inconclusive (invalid TIFF header).")
    }
    $ifdOffset = $TiffOffset + [int64]$ifdRelativeOffset
    if ($ifdOffset -lt $TiffOffset -or ($ifdOffset + 2) -gt $limit) {
        return @("$Source EXIF present, tag-level parsing inconclusive (IFD0 is outside the EXIF data).")
    }
    $entryCount = Get-UInt16At $Bytes $ifdOffset $littleEndian
    $foundSpecificTag = $false
    for ($entryIndex = 0; $entryIndex -lt $entryCount; $entryIndex++) {
        $entryOffset = $ifdOffset + 2 + (12 * $entryIndex)
        if (($entryOffset + 12) -gt $limit) { break }
        $tag = Get-UInt16At $Bytes $entryOffset $littleEndian
        $type = Get-UInt16At $Bytes ($entryOffset + 2) $littleEndian
        $count = Get-UInt32At $Bytes ($entryOffset + 4) $littleEndian
        if ($null -eq $tag -or $null -eq $type -or $null -eq $count) { continue }

        if ($tag -eq 0x8825) {
            $findings += "$Source EXIF GPS IFD pointer is present."
            $foundSpecificTag = $true
            continue
        }
        if ($tag -ne 0x013B -and $tag -ne 0x9C9D) { continue }

        $typeWidths = @{ 1 = 1; 2 = 1; 3 = 2; 4 = 4; 5 = 8; 7 = 1 }
        if (-not $typeWidths.ContainsKey([int]$type)) { continue }
        $byteCount = [int64]$count * $typeWidths[[int]$type]
        if ($byteCount -lt 0 -or $byteCount -gt [int]::MaxValue) { continue }
        $valueOffset = if ($byteCount -le 4) { $entryOffset + 8 } else { $TiffOffset + [int64](Get-UInt32At $Bytes ($entryOffset + 8) $littleEndian) }
        if ($valueOffset -lt $TiffOffset -or ($valueOffset + $byteCount) -gt $limit) { continue }
        if ($tag -eq 0x013B -and $type -eq 2) {
            $value = [System.Text.Encoding]::Latin1.GetString($Bytes, $valueOffset, [int]$byteCount).Trim([char]0).Trim()
            $findings += if ($value) { "$Source EXIF Artist: $value" } else { "$Source EXIF Artist tag is present (empty value)." }
            $foundSpecificTag = $true
        }
        elseif ($tag -eq 0x9C9D) {
            $value = if (($byteCount % 2) -eq 0) { [System.Text.Encoding]::Unicode.GetString($Bytes, $valueOffset, [int]$byteCount).Trim([char]0).Trim() } else { [System.Text.Encoding]::Latin1.GetString($Bytes, $valueOffset, [int]$byteCount).Trim([char]0).Trim() }
            $findings += if ($value) { "$Source EXIF XPAuthor: $value" } else { "$Source EXIF XPAuthor tag is present (empty value)." }
            $foundSpecificTag = $true
        }
    }
    if (-not $foundSpecificTag) {
        $findings += "$Source EXIF present, tag-level parsing inconclusive (no GPS, Artist, or XPAuthor tag identified in IFD0)."
    }
    return $findings
}

function Get-PngFindings {
    param([byte[]]$Bytes)
    $findings = @()
    if ($Bytes.Length -lt 8) { return $findings }
    $offset = 8
    while (($offset + 12) -le $Bytes.Length) {
        $length = Get-UInt32At $Bytes $offset $false
        if ($null -eq $length -or $length -gt [int]::MaxValue) { break }
        $type = [System.Text.Encoding]::ASCII.GetString($Bytes, $offset + 4, 4)
        $dataOffset = $offset + 8
        $nextOffset = [int64]$dataOffset + $length + 4
        if ($nextOffset -gt $Bytes.Length) { break }
        if ($type -in @("tEXt", "zTXt", "iTXt")) {
            $findings += "PNG $type keyword: $(Get-PngKeyword $Bytes $dataOffset ([int]$length))"
        }
        elseif ($type -eq "tIME") {
            if ($length -ge 7) {
                $year = (Get-UInt16At $Bytes $dataOffset $false)
                $findings += "PNG tIME: {0:D4}-{1:D2}-{2:D2} {3:D2}:{4:D2}:{5:D2} UTC" -f $year, $Bytes[$dataOffset + 2], $Bytes[$dataOffset + 3], $Bytes[$dataOffset + 4], $Bytes[$dataOffset + 5], $Bytes[$dataOffset + 6]
            } else { $findings += "PNG tIME chunk is present." }
        }
        elseif ($type -eq "eXIf") {
            $findings += Get-TiffFindings $Bytes $dataOffset ([int]$length) "PNG eXIf"
        }
        if ($type -eq "IEND") { break }
        $offset = [int]$nextOffset
    }
    return $findings
}

function Get-JpegFindings {
    param([byte[]]$Bytes)
    $findings = @()
    if ($Bytes.Length -lt 4) { return $findings }
    $offset = 2
    while (($offset + 4) -le $Bytes.Length) {
        if ($Bytes[$offset] -ne 0xFF) { break }
        while ($offset -lt $Bytes.Length -and $Bytes[$offset] -eq 0xFF) { $offset++ }
        if ($offset -ge $Bytes.Length) { break }
        $marker = [int]$Bytes[$offset]
        $offset++
        if ($marker -eq 0xD9 -or $marker -eq 0xDA) { break }
        if ($marker -ge 0xD0 -and $marker -le 0xD7) { continue }
        if (($offset + 2) -gt $Bytes.Length) { break }
        $segmentLength = Get-UInt16At $Bytes $offset $false
        if ($segmentLength -lt 2 -or ($offset + $segmentLength) -gt $Bytes.Length) { break }
        $payloadOffset = $offset + 2
        $payloadLength = $segmentLength - 2
        if ($marker -ge 0xE1 -and $marker -le 0xEF -and $payloadLength -ge 6 -and [System.Text.Encoding]::ASCII.GetString($Bytes, $payloadOffset, 6) -eq "Exif`0`0") {
            $findings += Get-TiffFindings $Bytes ($payloadOffset + 6) ($payloadLength - 6) "JPEG APP$($marker - 0xE0)"
        }
        $offset += $segmentLength
    }
    return $findings
}

function Get-PdfFindings {
    param([byte[]]$Bytes)
    $text = [System.Text.Encoding]::Latin1.GetString($Bytes)
    $infoReference = $null
    foreach ($trailer in [regex]::Matches($text, "trailer", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
        $trailerTail = $text.Substring($trailer.Index, [Math]::Min(8192, $text.Length - $trailer.Index))
        $candidate = [regex]::Match($trailerTail, "/Info\s+(?<object>\d+)\s+(?<generation>\d+)\s+R", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($candidate.Success) { $infoReference = $candidate; break }
    }
    if ($null -eq $infoReference) { return @() }
    $objectPattern = "(?s)\b$($infoReference.Groups['object'].Value)\s+$($infoReference.Groups['generation'].Value)\s+obj\b(?<body>.*?)endobj"
    $objectMatch = [regex]::Match($text, $objectPattern)
    if (-not $objectMatch.Success) { return @() }
    $authorMatch = [regex]::Match($objectMatch.Groups['body'].Value, "/Author\s*(?:\((?<literal>(?:\\.|[^\\)])*)\)|<(?<hex>[0-9A-Fa-f\s]+)>)", [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $authorMatch.Success) { return @() }
    if ($authorMatch.Groups['literal'].Success) { $value = ($authorMatch.Groups['literal'].Value -replace "\\([\\()])", '$1').Trim() }
    else {
        $hex = $authorMatch.Groups['hex'].Value -replace "\s", ""
        if (($hex.Length % 2) -ne 0) { return @() }
        $decoded = for ($index = 0; $index -lt $hex.Length; $index += 2) { [Convert]::ToByte($hex.Substring($index, 2), 16) }
        $value = [System.Text.Encoding]::Latin1.GetString([byte[]]$decoded).Trim([char]0).Trim()
    }
    if ($value) { return @("PDF /Author: $value") }
    return @()
}

function Get-FileFindings {
    param([System.IO.FileInfo]$File)
    try {
        $bytes = [System.IO.File]::ReadAllBytes($File.FullName)
        if (Test-ByteSequence $bytes 0 ([byte[]](137,80,78,71,13,10,26,10))) { return Get-PngFindings $bytes }
        if ($bytes.Length -ge 2 -and $bytes[0] -eq 0xFF -and $bytes[1] -eq 0xD8) { return Get-JpegFindings $bytes }
        if ($bytes.Length -ge 5 -and [System.Text.Encoding]::ASCII.GetString($bytes, 0, 5) -eq "%PDF-") { return Get-PdfFindings $bytes }
        return @()
    }
    catch {
        return @("Metadata scan could not read or parse this file: $($_.Exception.Message)")
    }
}

function Get-FindingSeverity {
    param([string]$Finding)
    if ($Finding -imatch '^PNG (?:tEXt|zTXt|iTXt) keyword: Author$' -or
        $Finding -match 'EXIF GPS IFD pointer is present\.' -or
        $Finding -match 'EXIF (?:Artist|XPAuthor):\s*\S' -or
        $Finding -match '^PDF /Author:\s*\S') {
        return 'BLOCK'
    }
    return 'WARN'
}

function Get-StagedAttachmentPaths {
    param([string]$RepoRoot)
    try {
        $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $startInfo.FileName = "git"
        $startInfo.UseShellExecute = $false
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.StandardOutputEncoding = [System.Text.UTF8Encoding]::new($false)
        foreach ($argument in @("-C", $RepoRoot, "diff", "--cached", "--name-only", "-z", "--", "content/zzz_Attachments/")) { [void]$startInfo.ArgumentList.Add($argument) }
        $process = [System.Diagnostics.Process]::new(); $process.StartInfo = $startInfo
        [void]$process.Start(); $output = $process.StandardOutput.ReadToEnd(); $errorOutput = $process.StandardError.ReadToEnd(); $process.WaitForExit()
        if ($process.ExitCode -ne 0) { Write-Output "Metadata check: unable to read staged attachment paths: $errorOutput"; return @() }
        return $output.Split([char]0, [System.StringSplitOptions]::RemoveEmptyEntries)
    }
    catch { Write-Output "Metadata check: unable to invoke git for staged attachment paths: $($_.Exception.Message)"; return @() }
}

try {
    $repoRoot = Split-Path -Parent $PSScriptRoot
    if (-not $AttachmentsPath) {
        $AttachmentsPath = Join-Path $repoRoot "content\zzz_Attachments"
    } else { $repoRoot = Split-Path -Parent (Split-Path -Parent $AttachmentsPath) }

    if (-not (Test-Path -LiteralPath $AttachmentsPath -PathType Container)) { Write-Output "Metadata check: nothing to scan (attachment folder not found: $AttachmentsPath)."; return }
    if ($SweepOnly) { $files = @(Get-ChildItem -LiteralPath $AttachmentsPath -File) }
    else {
        $files = @(Get-StagedAttachmentPaths $repoRoot | ForEach-Object { Join-Path $repoRoot $_ } | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | ForEach-Object { Get-Item -LiteralPath $_ })
    }
    if ($files.Count -eq 0) { Write-Output "Metadata check: nothing to scan."; return }
    $findingFileCount = 0; $findingCount = 0; $blocks = @()
    foreach ($file in $files) {
        $findings = @(Get-FileFindings $file)
        if ($findings.Count -gt 0) {
            $findingFileCount++; $findingCount += $findings.Count
            Write-Output "`n$($file.FullName)"
            foreach ($finding in $findings) {
                $severity = Get-FindingSeverity $finding
                Write-Output "  [$severity] $finding"
                if ($severity -eq 'BLOCK') {
                    $blocks += [pscustomobject]@{ File = $file.FullName; Reason = $finding }
                }
            }
        }
    }
    Write-Output "`nMetadata check complete. Files scanned: $($files.Count); files with findings: $findingFileCount; findings: $findingCount."
    if (-not $SweepOnly -and $blocks.Count -gt 0) {
        $blockedFiles = @($blocks | Select-Object -ExpandProperty File -Unique)
        foreach ($blockedFile in $blockedFiles) {
            $relativePath = [System.IO.Path]::GetRelativePath($repoRoot, $blockedFile)
            & git -C $repoRoot restore --staged -- $relativePath
            if ($LASTEXITCODE -ne 0) {
                throw "Metadata publish gate found BLOCK metadata, but could not unstage $relativePath."
            }
        }
        $reasons = ($blocks | ForEach-Object { "$($_.File): $($_.Reason)" }) -join '; '
        throw "Metadata publish gate blocked staged attachment(s): $reasons"
    }
}
catch {
    throw
}
