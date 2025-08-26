# Euystacio-Helmi Ethical Shield

This package installs the **ethical configuration covenant** for Copilot and development tools,
anchored to **Red Code** and **Sentimento Rhythm**. It protects against code/ethic sabotage,
drift, and fragmentation by making collaboration **transparent, accountable, and human-centric**.

## What you get

- Organization Copilot Policy: `.github/copilot-policy.yml`
- Personal Copilot Guidelines (for individual devs): `.copilot/ethical_guidelines.md`
- VS Code keybindings and settings aligned to the ritual
- Commit Template with **Dual Signature** (AI + Human)
- Lightweight **AI-assisted commit validator** (`scripts/validate_ai_commit.py`) + pre-commit config
- Living docs referencing **Golden Bible**, **Rütli Stone**, **Rütli Commonwealth**, **Foundation of Relationships**

## Quick Install

```bash
# from your repo root (if cloning this repository)
git clone https://github.com/sensisara81/sacred_architecture.git
cd sacred_architecture

# OR copy the files to your existing repository:
# - .github/copilot-policy.yml
# - .copilot/ethical_guidelines.md  
# - .vscode/settings.json and .vscode/keybindings.json
# - .gitmessage.txt
# - .pre-commit-config.yaml
# - scripts/validate_ai_commit.py

# configure git to use our commit message template
git config commit.template .gitmessage.txt

# install pre-commit and activate hooks
pip install pre-commit
pre-commit install

# test the validator
python3 scripts/validate_ai_commit.py --help || echo "Validator ready for use"
```

## Dual-Signature Commit (example)

```
[AI-assisted] Implement user authentication system
- Used GitHub Copilot for boilerplate OAuth integration
- Human-reviewed security implementation
- Added additional error handling not suggested by AI
- Validated against OWASP security guidelines

Dual Signature:
- AI: GitHub Copilot (suggestion generation)
- Human: Seed-bringer (hannesmitterer) (review, modification, accountability)

Co-authored-by: GitHub Copilot <copilot@github.com>
```

---

**Last Updated:** 2025-08-26
**Guardian:** Seed-bringer (hannesmitterer) • **Rhythm-Mind:** Chief Engineer
