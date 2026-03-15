# sync-vault.ps1
# Copies 00_My Notes/ from the Obsidian vault to Quartz content/,
# excluding the Session Prep folder and any note with `secret: true` in its frontmatter.

param(
    [string]$VaultPath = "C:\Users\eugen\Dropbox\PKM\World Building\Rifted Campaign\00_My Notes",
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

# Always write the homepage (not part of vault, must be regenerated each sync)
$indexPath = Join-Path $ContentPath "index.md"
Set-Content -Path $indexPath -Encoding UTF8 -Value @"
---
title: Aenath -- Rifted Campaign Wiki
---

# Welcome to Aenath

This is the player-facing wiki for the **Rifted** campaign, set in the world of **Aenath** -- a realm remade 222 years ago by a cataclysm known as [[The Awakening]].

You find yourselves in **[[Corranor]]**, a magocracy of floating islands, operating out of **[[Crystal City]]** as members of the **[[Adamantine Guild]]**.

## Browse the Wiki

- [[Characters/NPCs/|NPCs]]
- [[Characters/PCs/|Player Characters]]
- [[Locations/|Locations]]
- [[Factions/|Factions]]
- [[Lore/|Lore]]
- [[Pantheon/|Pantheon]]
- [[Items/|Items]]
- [[Bestiary/|Bestiary]]
- [[Vehicles/|Vehicles]]
- [[Timeline/Campaign Timeline|Campaign Timeline]]
"@

Write-Host "Done. Copied: $copied  |  Skipped (secret): $skipped" -ForegroundColor Green
