# publish.ps1
# Syncs vault content and pushes to GitHub in one shot.
# Double-click "Publish Wiki.bat" to run.

$ErrorActionPreference = "Stop"
$QuartzPath = $PSScriptRoot

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rifted Wiki Publisher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    # Step 1: Sync vault
    Write-Host "Step 1/3 -- Syncing vault..." -ForegroundColor Yellow
    & "$QuartzPath\sync-vault.ps1"
    Write-Host ""

    # Step 2: Stage all changes
    Write-Host "Step 2/3 -- Staging changes..." -ForegroundColor Yellow
    Set-Location $QuartzPath
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "No changes to publish." -ForegroundColor Green
        Write-Host ""
        Write-Host "Press any key to close..."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        exit 0
    }
    git add -A
    Write-Host ""

    # Step 3: Commit and push
    Write-Host "Step 3/3 -- Publishing to GitHub..." -ForegroundColor Yellow
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "Update content ($timestamp)"
    git push

    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  Done! Site will be live in ~2 min." -ForegroundColor Green
    Write-Host "  https://khelbenlaforge.github.io/rifted" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green

} catch {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ERROR -- publish failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
}

Write-Host "Press any key to close..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
