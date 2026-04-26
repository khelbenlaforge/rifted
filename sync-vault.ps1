# sync-vault.ps1
# Copies 00_My Notes/ from the Obsidian vault to Quartz content/,
# excluding the Session Prep folder and any note with `secret: true` in its frontmatter.
# Uses a temp staging dir for atomic swap — content/ is only cleared after a successful sync.

param(
    [string]$VaultPath = "D:\PKM\World Building\Rifted Campaign\00_My Notes",
    [string]$ContentPath = "$PSScriptRoot\content"
)

# Stage into system temp to keep the working tree clean and ensure git never sees a half-sync
$StagingPath = Join-Path ([System.IO.Path]::GetTempPath()) "quartz-rifted-staging"
if (Test-Path $StagingPath) { Remove-Item $StagingPath -Recurse -Force }
New-Item -ItemType Directory -Path $StagingPath -Force | Out-Null

$copied = 0
$skipped = 0

# Walk all markdown files in the vault source (excluding Session Prep folder)
Get-ChildItem -Path $VaultPath -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notlike "*\Session Prep\*"
} | ForEach-Object {
    $file = $_
    $content = Get-Content $file.FullName -Raw -Encoding UTF8

    # Check for `secret: true` in YAML frontmatter only (between the opening --- delimiters)
    $fmMatch = [regex]::Match($content, '(?s)^---\r?\n(.*?)\r?\n---')
    if ($fmMatch.Success -and $fmMatch.Groups[1].Value -match '(?m)^secret:\s*true\s*$') {
        $skipped++
        return
    }

    # Strip statblock codeblocks
    $content = $content -replace '(?s)```statblock\r?\n.*?```', ''

    # Strip DM Notes section — heading matched exactly at end-of-line, then everything until
    # the next ## heading or EOF. The \s*$ prevents matching "## DM Notes on X" variants.
    $content = $content -replace '(?ms)^## DM Notes\s*$.*?(?=^## |\z)', ''

    # Build mirrored destination path (into staging)
    $relativePath = $file.FullName.Substring($VaultPath.Length).TrimStart('\')
    $destPath = Join-Path $StagingPath $relativePath
    $destDir = Split-Path $destPath -Parent

    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    Set-Content -Path $destPath -Value $content -Encoding utf8NoBOM
    $copied++
}

Write-Host "Done. Copied: $copied  |  Skipped (secret): $skipped" -ForegroundColor Green

# Copy images from zzz_Attachments recursively, preserving subfolder structure
$AttachmentsSource = "D:\PKM\World Building\zzz_Attachments"
$AttachmentsDest   = Join-Path $StagingPath "zzz_Attachments"

$imageExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg')
$imgCopied = 0

Get-ChildItem -Path $AttachmentsSource -File -Recurse | Where-Object {
    $imageExtensions -contains $_.Extension.ToLower()
} | ForEach-Object {
    $relativePath = $_.FullName.Substring($AttachmentsSource.Length).TrimStart('\')
    $destFile = Join-Path $AttachmentsDest $relativePath
    $destDir = Split-Path $destFile -Parent
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }
    Copy-Item -Path $_.FullName -Destination $destFile -Force
    $imgCopied++
}

Write-Host "Images copied: $imgCopied" -ForegroundColor Green

# Atomic swap: sync succeeded — now replace content/ with staging output
Write-Host "Swapping content/..." -ForegroundColor Yellow
Get-ChildItem -Path $ContentPath -Exclude ".gitkeep" | Remove-Item -Force -Recurse
Get-ChildItem -Path $StagingPath | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $ContentPath -Force
}
Remove-Item $StagingPath -Recurse -Force

Write-Host "Sync complete." -ForegroundColor Green
