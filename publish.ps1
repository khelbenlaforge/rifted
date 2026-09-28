# publish.ps1
# Syncs vault content and pushes to GitHub in one shot.
# Double-click "Publish Wiki.bat" to run.

$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true  # non-zero exit from git etc. throws (pwsh 7.3+)
$QuartzPath = $PSScriptRoot

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Rifted Wiki Publisher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    # Preflight: branch and unpushed-commit checks run before any mutation, so a clean
    # working tree can't short-circuit past them (previously sync-vault ran first and a
    # no-op sync exited 0 via the "No changes to publish" path without ever reaching this
    # check, silently bypassing the unpushed-commits gate).
    Set-Location $QuartzPath
    $branch = git rev-parse --abbrev-ref HEAD
    if ($branch -ne "main") {
        throw "Not on main branch (currently '$branch'). Aborting to prevent accidental publish."
    }
    if (git rev-list '@{u}..HEAD') {
        throw "main already has unpushed commits that did not pass the publish gates. Review and push them yourself first."
    }

    # Step 1: Sync vault
    Write-Host "Step 1/3 -- Syncing vault..." -ForegroundColor Yellow
    & "$QuartzPath\sync-vault.ps1"
    Write-Host ""

    # Step 2: Stage all changes
    Write-Host "Step 2/3 -- Staging changes..." -ForegroundColor Yellow
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "No changes to publish." -ForegroundColor Green
        Write-Host ""
        Write-Host "Press any key to close..."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        exit 0
    }
    git add content/ quartz/static/
    if (git diff --cached --name-only -- . ':(exclude)content/' ':(exclude)quartz/static/') {
        throw "Files outside content/ and quartz/static/ are staged; they would be published ungated. Unstage or commit them separately first."
    }
    & "$QuartzPath\scripts\check-private-names.ps1"
    & "$QuartzPath\scripts\check-image-metadata.ps1"
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
