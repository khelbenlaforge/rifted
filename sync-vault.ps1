# sync-vault.ps1
# Copies 00_My Notes/ from the Obsidian vault to Quartz content/,
# excluding any note with `secret: true` in its frontmatter.

param(
    [string]$VaultPath = "C:\Users\eugen\Dropbox\PKM\World Building\Rifted Campaign\00_My Notes",
    [string]$ContentPath = "$PSScriptRoot\content"
)

# Clear existing content (keep .gitkeep if present)
Write-Host "Clearing content folder..." -ForegroundColor Yellow
Get-ChildItem -Path $ContentPath -Recurse -Exclude ".gitkeep" | Remove-Item -Force -Recurse

$copied = 0
$skipped = 0

# Walk all markdown files in the vault source
Get-ChildItem -Path $VaultPath -Recurse -Filter "*.md" | ForEach-Object {
    $file = $_
    $content = Get-Content $file.FullName -Raw -Encoding UTF8

    # Check for `secret: true` in frontmatter (simple regex, covers `secret: true` with optional whitespace)
    if ($content -match '(?m)^secret:\s*true\s*$') {
        $skipped++
        return
    }

    # Build mirrored destination path
    $relativePath = $file.FullName.Substring($VaultPath.Length).TrimStart('\')
    $destPath = Join-Path $ContentPath $relativePath
    $destDir = Split-Path $destPath -Parent

    # Create destination directory if needed
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    Copy-Item $file.FullName -Destination $destPath -Force
    $copied++
}

Write-Host "Done. Copied: $copied  |  Skipped (secret): $skipped" -ForegroundColor Green
Write-Host ""
Write-Host "Next: cd to quartz-rifted and run:" -ForegroundColor Cyan
Write-Host "  npx quartz build --serve   (preview locally)" -ForegroundColor Cyan
Write-Host "  npx quartz sync            (push to GitHub Pages)" -ForegroundColor Cyan
