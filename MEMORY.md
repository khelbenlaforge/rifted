# Session Memory - Rifted Project

## Current Setup (Updated: 2026-03-19)

### Architecture
- **Windows System**: Obsidian vault + Claude Code manages source and Quartz config
- **This Repository**: Deployment output (generated files)
- **Mobile/Alternate Access**: This Claude Code session on Linux
- **Deployment**: GitHub Pages via GitHub Actions

### Active Branches
- `claude/obsidian-vault-integration-nG10E` - Main dev (Windows pushes here)
- `claude/mobile-testing-nG10E` - Mobile/testing (current working branch)
- `main` - Deployed stable version

### Key Context
- User switches between Windows Obsidian and mobile/remote access
- Windows system auto-manages and pushes changes
- This repo should be treated as deployment pipeline (mostly read-only)
- Mobile branch exists for UI testing when away from Windows

---

## Session Notes

### 2026-03-19 Initial Setup
**What was done:**
- Clarified that this repo is deployment output, not source
- Created mobile-testing branch for away-from-Windows work
- Created CLAUDE.md with comprehensive workflow documentation
- Set up memory file for cross-session tracking

**Decision made:**
- Use one-way sync: Windows (source) → this repo (deploy) → GitHub Pages
- Keep mobile branch separate from main dev to prevent conflicts
- All UI/styling tests happen on mobile branch first

**Current Status:**
- CLAUDE.md created and committed
- Mobile branch ready to use
- No pending changes to content or config

**Next time user works here:**
- Use `claude/mobile-testing-nG10E` branch
- Follow CLAUDE.md for workflow guidance
- Document UI changes clearly in commits

---

## Important Reminders

⚠️ **Don't Forget:**
- Don't edit markdown content files directly here (Windows source owns them)
- Don't pull from main dev branch into mobile branch (causes confusion)
- Always commit before switching sessions
- Use [MOBILE] prefix in commit messages when working from this session

✅ **Safe to Edit:**
- Quartz theme/styling files
- Build configuration
- GitHub Pages workflows
- Non-content config files

---

## Pending Work

- [ ] Test UI changes on mobile branch when ready
- [ ] Create PR back to main dev when mobile work is ready to deploy
- [ ] Review and apply approved changes on Windows system

---

## File Locations Reference

- CLAUDE.md - Workflow documentation
- MEMORY.md - This file (session notes)
- quartz.config.ts - Main Quartz configuration
- quartz/ folder - Theme and component files
- .github/workflows/ - GitHub Actions deployment

---

## Questions for Next Session

_Leave notes here if unsure about something or need to revisit a decision._

- None yet
