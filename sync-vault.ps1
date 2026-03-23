# sync-vault.ps1
# Copies 00_My Notes/ from the Obsidian vault to Quartz content/,
# excluding the Session Prep folder and any note with `secret: true` in its frontmatter.

param(
    [string]$VaultPath = "D:\PKM\World Building\Rifted Campaign\00_My Notes",
    [string]$ContentPath = "$PSScriptRoot\content"
)

# Clear existing content (keep .gitkeep)
Write-Host "Clearing content folder..." -ForegroundColor Yellow
Get-ChildItem -Path $ContentPath -Recurse -Exclude ".gitkeep" | Remove-Item -Force -Recurse

$copied = 0
$skipped = 0

# Walk all markdown files in the vault source (excluding Session Prep folder)
Get-ChildItem -Path $VaultPath -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notlike "*\Session Prep\*"
} | ForEach-Object {
    $file = $_
    $content = Get-Content $file.FullName -Raw -Encoding UTF8

    # Check for `secret: true` in frontmatter
    if ($content -match '(?m)^secret:\s*true\s*$') {
        $skipped++
        return
    }

    # Strip statblock codeblocks
    $content = $content -replace '(?s)```statblock\r?\n.*?```', ''

    # Strip DM Notes section (heading + all content until next ## heading or end of file)
    $content = $content -replace '(?ms)^## DM Notes\b.*?(?=^## |\z)', ''

    # Build mirrored destination path
    $relativePath = $file.FullName.Substring($VaultPath.Length).TrimStart('\')
    $destPath = Join-Path $ContentPath $relativePath
    $destDir = Split-Path $destPath -Parent

    # Create destination directory if needed
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    Set-Content -Path $destPath -Value $content -Encoding UTF8
    $copied++
}

Write-Host "Done. Copied: $copied  |  Skipped (secret): $skipped" -ForegroundColor Green

# Copy images from zzz_Attachments to content/zzz_Attachments
$AttachmentsSource = "D:\PKM\World Building\zzz_Attachments"
$AttachmentsDest   = Join-Path $ContentPath "zzz_Attachments"

if (-not (Test-Path $AttachmentsDest)) {
    New-Item -ItemType Directory -Path $AttachmentsDest -Force | Out-Null
}

$imageExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg')
$imgCopied = 0

Get-ChildItem -Path $AttachmentsSource -File | Where-Object {
    $imageExtensions -contains $_.Extension.ToLower()
} | ForEach-Object {
    $destFile = Join-Path $AttachmentsDest $_.Name
    Copy-Item -Path $_.FullName -Destination $destFile -Force
    $imgCopied++
}

Write-Host "Images copied: $imgCopied" -ForegroundColor Green
