# sync-vault.ps1
# Pass 1: Copies The Exodus/00_My Notes/ from the Obsidian vault to Quartz content/,
#         excluding Session Prep and any note with `secret: true` in frontmatter.
# Pass 2: Copies Sessions/ from every campaign folder under The Exodus/ (e.g. The Door Kickers,
#         Lore Obscure) to content/[CampaignName]/Sessions/ — one subfolder per campaign.
# Uses a temp staging dir for atomic swap — content/ is only cleared after a successful sync.

param(
    [string]$WorldPath    = "D:\PKM\World Building\The Exodus",
    [string]$ContentPath  = "$PSScriptRoot\content"
)

$VaultPath = Join-Path $WorldPath "00_My Notes"

# Stage into system temp to keep the working tree clean and ensure git never sees a half-sync
$StagingPath = Join-Path ([System.IO.Path]::GetTempPath()) "quartz-rifted-staging"
if (Test-Path $StagingPath) { Remove-Item $StagingPath -Recurse -Force }
New-Item -ItemType Directory -Path $StagingPath -Force | Out-Null

$copied = 0
$skipped = 0

function Process-MarkdownFile {
    param(
        [string]$SourceFile,
        [string]$SourceRoot,
        [string]$DestRoot
    )

    $content = Get-Content $SourceFile -Raw -Encoding UTF8

    # Check for `secret: true` in YAML frontmatter only (between the opening --- delimiters)
    $fmMatch = [regex]::Match($content, '(?s)^---\r?\n(.*?)\r?\n---')
    if ($fmMatch.Success -and $fmMatch.Groups[1].Value -match '(?m)^secret:\s*true\s*$') {
        return $false
    }

    # Strip statblock codeblocks
    $content = $content -replace '(?s)```statblock\r?\n.*?```', ''

    # Strip DM Notes section — heading matched exactly at end-of-line, then everything until
    # the next ## heading or EOF. The \s*$ prevents matching "## DM Notes on X" variants.
    $content = $content -replace '(?ms)^## DM Notes\s*$.*?(?=^## |\z)', ''

    # Build mirrored destination path (into staging)
    $relativePath = $SourceFile.Substring($SourceRoot.Length).TrimStart('\')
    $destPath = Join-Path $DestRoot $relativePath
    $destDir = Split-Path $destPath -Parent

    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    Set-Content -Path $destPath -Value $content -Encoding utf8NoBOM
    return $true
}

# --- Pass 1: World content (00_My Notes/) → content/ root ---

Write-Host "Pass 1: Syncing world content from 00_My Notes/..." -ForegroundColor Cyan

Get-ChildItem -Path $VaultPath -Recurse -Filter "*.md" | Where-Object {
    $_.FullName -notlike "*\Session Prep\*" -and $_.FullName -notlike "*\Ingest\*"
} | ForEach-Object {
    $result = Process-MarkdownFile -SourceFile $_.FullName -SourceRoot $VaultPath -DestRoot $StagingPath
    if ($result) { $copied++ } else { $skipped++ }
}

Write-Host "  Copied: $copied  |  Skipped (secret): $skipped" -ForegroundColor Green

# --- Pass 2: Campaign sessions → content/[CampaignName]/Sessions/ ---

Write-Host "Pass 2: Syncing campaign sessions..." -ForegroundColor Cyan

$sessionsCopied = 0
$sessionsSkipped = 0

Get-ChildItem -Path $WorldPath -Directory | Where-Object {
    $_.Name -ne "00_My Notes"
} | ForEach-Object {
    $campaignFolder = $_
    $sessionsPath = Join-Path $campaignFolder.FullName "Sessions"

    if (-not (Test-Path $sessionsPath)) {
        Write-Host "  $($campaignFolder.Name): no Sessions/ folder, skipping." -ForegroundColor Gray
        return
    }

    $campaignDest = Join-Path $StagingPath $campaignFolder.Name
    $sessionsDest = Join-Path $campaignDest "Sessions"

    $campaignCount = 0
    $campaignSkipped = 0

    Get-ChildItem -Path $sessionsPath -Filter "*.md" | ForEach-Object {
        $result = Process-MarkdownFile -SourceFile $_.FullName -SourceRoot $sessionsPath -DestRoot $sessionsDest
        if ($result) { $campaignCount++; $sessionsCopied++ } else { $campaignSkipped++; $sessionsSkipped++ }
    }

    Write-Host "  $($campaignFolder.Name): $campaignCount sessions copied, $campaignSkipped skipped." -ForegroundColor Green
}

Write-Host "Sessions total — Copied: $sessionsCopied  |  Skipped (secret): $sessionsSkipped" -ForegroundColor Green

# --- Pass 3: Campaign PCs → content/Characters/PCs/[CampaignName]/ ---

Write-Host "Pass 3: Syncing campaign PCs..." -ForegroundColor Cyan

$pcsCopied = 0
$pcsSkipped = 0

Get-ChildItem -Path $WorldPath -Directory | Where-Object {
    $_.Name -ne "00_My Notes"
} | ForEach-Object {
    $campaignFolder = $_
    $pcsPath = Join-Path $campaignFolder.FullName "PCs"

    if (-not (Test-Path $pcsPath)) {
        Write-Host "  $($campaignFolder.Name): no PCs/ folder, skipping." -ForegroundColor Gray
        return
    }

    $pcsDest = Join-Path $StagingPath "Characters\PCs\$($campaignFolder.Name)"

    $campaignCount = 0
    $campaignSkipped = 0

    Get-ChildItem -Path $pcsPath -Filter "*.md" | ForEach-Object {
        $raw = Get-Content $_.FullName -Raw -Encoding UTF8
        $fm = [regex]::Match($raw, '(?s)^---\r?\n(.*?)\r?\n---')
        if ($fm.Success -and $fm.Groups[1].Value -match 'one-shot') {
            $campaignSkipped++; $pcsSkipped++
            return
        }
        $result = Process-MarkdownFile -SourceFile $_.FullName -SourceRoot $pcsPath -DestRoot $pcsDest
        if ($result) { $campaignCount++; $pcsCopied++ } else { $campaignSkipped++; $pcsSkipped++ }
    }

    Write-Host "  $($campaignFolder.Name): $campaignCount PCs copied, $campaignSkipped skipped." -ForegroundColor Green
}

Write-Host "PCs total — Copied: $pcsCopied  |  Skipped (secret): $pcsSkipped" -ForegroundColor Green

# --- Attachments ---

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

# --- Atomic swap ---

Write-Host "Swapping content/..." -ForegroundColor Yellow
Get-ChildItem -Path $ContentPath -Exclude ".gitkeep" | Remove-Item -Force -Recurse
Get-ChildItem -Path $StagingPath | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $ContentPath -Force
}
Remove-Item $StagingPath -Recurse -Force

Write-Host "Sync complete." -ForegroundColor Green
