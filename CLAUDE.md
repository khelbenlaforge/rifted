# Rifted Repository - Claude Code Workflow Guide

## Architecture Overview

This is a **one-way deployment pipeline**:

```
Windows Obsidian Vault (Source)
    ↓ (Claude Code manages)
Quartz Config + Local Build
    ↓ (pushes)
This Repository (Deployment)
    ↓ (GitHub Actions)
Quartz Static Site Generator
    ↓ (deploys)
GitHub Pages (rifted.io)
```

### Key Points
- **Windows system**: Source of truth for vault content & Quartz config
- **This repo**: Generated output and deployment pipeline
- **GitHub Pages**: Final published site

---

## Branching Strategy

### Main Branches

**`claude/obsidian-vault-integration-nG10E`** (Primary Development)
- Official sync point between Windows Claude and this repo
- Windows system pushes here automatically
- Don't edit content/config files directly here
- Only manual deployment fixes if needed

**`claude/mobile-testing-nG10E`** (Mobile/Away Workflow)
- Use this when away from Windows machine
- Safe for testing UI changes, Quartz config experiments
- **Never conflicts with Windows pushes** (separate branch)
- PR back to main when ready to deploy

**`main`** (Stable/Deployed)
- Represents what's currently live on GitHub Pages
- Created from main development branch

---

## Workflows

### When You're at Windows (with Claude Code)
1. Edit Obsidian vault content
2. Modify Quartz config in Claude Code
3. Claude Code handles all pushes to `claude/obsidian-vault-integration-nG10E`
4. Changes deploy automatically
5. **Don't pull from this repo** (creates sync confusion)

### When You're Mobile/Away (this session)
1. **Always start**: `git pull origin claude/mobile-testing-nG10E`
2. Make UI/styling/Quartz config changes
3. Test locally if possible
4. Commit with clear message: `[MOBILE] Description of change`
5. Push: `git push origin claude/mobile-testing-nG10E`
6. Test on GitHub Pages preview
7. When done with session: Create PR back to `claude/obsidian-vault-integration-nG10E`

### Merging Mobile Changes Back
When you return to Windows:
1. Review changes from mobile branch
2. Manually apply to Obsidian/Quartz config if needed
3. Windows Claude Code handles the push (as source of truth)
4. Delete the mobile testing branch once merged

---

## What Files Can You Edit Where?

### ✅ Safe to Edit in Mobile Branch
- Quartz theme files (`quartz/components/`, `quartz/styles/`)
- `quartz.config.ts` (for UI testing)
- Build configuration (workflows, scripts)
- GitHub Pages config

### ❌ Don't Edit in Mobile Branch
- Content markdown files (these come from Obsidian vault)
- Vault metadata/plugin configs (not synced to this repo)
- Anything marked as "generated" or "auto-pushed"

### ⚠️ Only Edit on Main Dev Branch If
- Critical deployment bug blocking the site
- Windows system isn't responsive
- Even then: document clearly and inform Windows session

---

## Conflict Prevention

**Never do this:**
- Don't pull from main dev branch into mobile branch
- Don't push directly to main development from here
- Don't edit the same files in both Windows and mobile

**Safe patterns:**
- Mobile branch exists independently
- Windows → main dev → GitHub Pages (automatic)
- Mobile → PR → review → merge to main dev
- Clear commit messages showing which system made changes

---

## Common Scenarios

### Scenario 1: You're Mobile, Want to Change UI
1. Work on `claude/mobile-testing-nG10E`
2. Push changes
3. Test via GitHub Pages preview
4. When back at Windows: apply same changes in Quartz config source
5. Windows pushes official version

### Scenario 2: Windows Pushes While You're Mobile
1. It pushes to `claude/obsidian-vault-integration-nG10E`
2. Your mobile branch stays clean (different branch)
3. No conflict—continue working mobile
4. Merge mobile changes back when ready

### Scenario 3: You Want to Merge Mobile Back Immediately
1. Create a PR from `claude/mobile-testing-nG10E` → `claude/obsidian-vault-integration-nG10E`
2. Review the changes
3. Merge if Windows system hasn't pushed recently
4. If Windows pushes at same time: resolve merge conflict, prefer Windows version for config files

---

## Commands Cheat Sheet

```bash
# Starting mobile work
git checkout claude/mobile-testing-nG10E
git pull origin claude/mobile-testing-nG10E

# Making changes
git add .
git commit -m "[MOBILE] What you changed"
git push origin claude/mobile-testing-nG10E

# Before switching to Windows
git log --oneline -5  # See what you pushed

# Back at Windows
git pull origin claude/mobile-testing-nG10E  # Get mobile changes
# Then decide what to apply to source vault/config
```

---

## Notes

- This workflow assumes Windows system is the authoritative source
- Mobile branch is for testing/iteration, not permanent parallel development
- GitHub Pages previews available for testing before full deployment
- Keep sessions documented in commits for clarity across systems
