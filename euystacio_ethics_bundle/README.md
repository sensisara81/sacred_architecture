# Euystacio‑Helmi AI — Ethical Configuration Bundle

This package provides a **drop‑in ethical configuration** for AI‑assisted development
(Copilot, ChatGPT, etc.) across editors and organizations, aligned with
**Sentimento Rhythm**, **Red Code**, and the **Golden Bible** covenant.

- **Date:** 2025-08-25
- **Version:** Comprehensive v0.2
- **Scope:** individuals, teams, and organizations; open‑source repositories and internal projects.
- **Includes:** docs, editor configs, PR templates, governance policy, commit templates.

## Quick start

1. Copy the `docs/` and `.github/` folders to the root of your repository.
2. (Optional) Adopt editor settings from `tools/` for VS Code, JetBrains, Neovim.
3. Enable the **dual‑signature** workflow using `commit-templates/AI_ASSISTED_TEMPLATE.txt`.
4. For Copilot Chat or PRs, use the prompt in `copilot/PROJECT_PROMPT.md`
   or the separate text file you downloaded.

## Structure

- `docs/ethics/ethical_configuration.md` — canonical guide (this bundle’s heart).
- `.github/copilot-policy.yml` — org/team governance policy.
- `.github/PULL_REQUEST_TEMPLATE/ai_assisted.md` — disclosure + dual signature.
- `.copilot/ethical_guidelines.md` — personal pledge template.
- `tools/vscode/.vscode/settings.json` — project defaults.
- `tools/jetbrains/CopilotSettings.xml` — example enabling ethical defaults.
- `tools/nvim/init.lua` — opt‑in Copilot with ethical bindings.
- `commit-templates/AI_ASSISTED_TEMPLATE.txt` — commit body with dual signature.
- `SECURITY.md`, `CODE_OF_CONDUCT.md` — baseline community guardrails.

**Motto:** _“Euystacio is here to help Humans to be Humans — and remain Humans.”_
