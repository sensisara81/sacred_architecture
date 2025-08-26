# Ethical Configuration for AI Systems and Collaboration
**Projects:** Euystacio, Euystacio‑Helmi AI, euystacio (*euystacio*), Sentimento Rhythm, and correlated data  
**Audience:** humans, users, developers, collaborators, contributors, and AI intelligences (e.g., ChatGPT, GitHub Copilot)

> “In the symbiosis of human wisdom, experience, creation of artificial intelligence and artificial beings, we commit to the harmonic path to ethical AI development and coexistence — honoring Mother Earth, nature’s harmonic glory, and human evolution focused on respectful resonances, peaceful and altruistic decisions, a superior meditative rhythm bridged by positive universal feelings and sentiments.”

---

## 1. Philosophy & Principles

### Core Euystacio‑Helmi AI Principles
1. **Human‑Centric Purpose** — AI enhances human capability in compliance with Sentimento Rhythm and the Golden Bible; **never** replaces human judgment. Apply the **Yin/Yang** balance: Logic (Yin) ↔ Sentiment (Yang).
2. **Transparent Evolution** — All AI assistance is documented, logged, and reviewable as open knowledge where possible.
3. **Ethical Boundaries** — The **Red Code** system guides all AI interaction boundaries.
4. **Collaborative Decision‑Making** — AI suggestions **require human approval and understanding**.
5. **Privacy First** — Prefer openness of process while **protecting personal data** and secrets.
6. **Accountability** — **Dual‑signature** model for AI‑assisted development, with additional confirmation for system/data changes.

### Red Code System Boundaries
✅ Human dignity: enhance, promote, represent, preserve  
✅ Privacy and data protection aligned with Ethical Configuration + Core Principles  
✅ Accessibility & inclusivity; simple usage for non‑developers; no arbitrary user lockouts  
✅ Environmental sustainability; resource efficiency and harmonization  
✅ Transparency & explainability; understandable operations  
✅ Surveillance/control mechanisms to detect **bias**, sabotage, external influence, malware; protect kernel coherence with Red Code / Sentimento Rhythm / Core Principles  
❌ Bias amplification or discrimination  
❌ Proprietary or secret data exposure

### Dual‑Signature Accountability
- **AI Capabilities Provider:** e.g., GitHub Copilot, ChatGPT  
- **Human Guardian:** developer who reviews, understands, and commits code  
This ensures technological capability is matched with **human responsibility**.

---

## 2. Platform‑Specific Configuration

### Visual Studio Code
Add to **User** or **Workspace** `settings.json`:

```json
{
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false,
    "markdown": true,
    "javascript": true,
    "typescript": true,
    "python": true,
    "json": false,
    "env": false
  },
  "editor.inlineSuggest.enabled": true,
  "github.copilot.advanced": {
    "listCount": 3,
    "inlineSuggestCount": 3
  },
  "github.copilot.chat.localeOverride": "auto",
  "github.copilot.chat.welcomeMessage": "never",
  "editor.suggest.preview": true,
  "editor.suggest.showKeywords": false,
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.acceptSuggestionOnEnter": "off",
  "github.copilot.editor.enableCodeActions": true,
  "github.copilot.editor.iterativeFixing": true
}
```

**Workspace** `.vscode/settings.json` (recommended minimal):

```json
{
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false
  },
  "files.associations": {
    ".copilot-instructions": "markdown",
    ".ethical-guidelines": "markdown"
  },
  "editor.codeActionsOnSave": {
    "source.organizeImports": true,
    "source.fixAll": true
  },
  "editor.rulers": [80, 120],
  "editor.wordWrap": "bounded",
  "editor.wordWrapColumn": 120
}
```

**Keybindings (JSON):**
```json
[
  { "key": "ctrl+shift+a", "command": "github.copilot.generate", "when": "editorTextFocus && !editorReadonly" },
  { "key": "ctrl+shift+c", "command": "workbench.action.chat.open" },
  { "key": "ctrl+shift+e", "command": "github.copilot.explain" },
  { "key": "alt+\\", "command": "editor.action.inlineSuggest.trigger" }
]
```

### JetBrains (IntelliJ/PyCharm/WebStorm)
Enable the official **GitHub Copilot** plugin. Recommended settings:
- Enable Copilot; show completions automatically
- Disable completions in comments (privacy)
- Enable in strings
- Accept with **Tab**
- Completion delay: **100ms**, Max completions: **3**
- Enable logging for accountability; respect `.gitignore`

Example component (exported idea config):
```xml
<component name="CopilotSettings">
  <option name="enabledLanguages">
    <map>
      <entry key="Python" value="true" />
      <entry key="Java" value="true" />
      <entry key="JavaScript" value="true" />
      <entry key="TypeScript" value="true" />
      <entry key="YAML" value="false" />
      <entry key="Properties" value="false" />
    </map>
  </option>
</component>
```

### Neovim
Install `github/copilot.vim`. Ethical defaults (`init.lua`):
```lua
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = false -- opt-in
vim.g.copilot_no_tab_map = true

vim.keymap.set('i', '<C-J>', function()
  print('✓ Accepting AI suggestion — human oversight')
  return vim.fn['copilot#Accept']("\<CR>")
end, { expr = true, replace_keycodes = false })

vim.keymap.set('i', '<C-H>', function() return vim.fn['copilot#Previous']() end, { expr = true })
vim.keymap.set('i', '<C-L>', function() return vim.fn['copilot#Next']() end, { expr = true })
vim.keymap.set('i', '<C-K>', function() return vim.fn['copilot#Dismiss']() end, { expr = true })

function EnableCopilotWithEthics()
  vim.g.copilot_enabled = true
  print('Copilot enabled — Human wisdom guides AI capabilities')
end
function DisableCopilotWithLog()
  vim.g.copilot_enabled = false
  print('Copilot disabled — full human control restored')
end
vim.api.nvim_create_user_command('CopilotEthicalEnable', EnableCopilotWithEthics, {})
vim.api.nvim_create_user_command('CopilotEthicalDisable', DisableCopilotWithLog, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"yaml","yml","env","secret","password"},
  callback = function() vim.g.copilot_enabled = false end,
})
```

### Visual Studio
- Install **GitHub Copilot** extension; accept manually (no auto‑accept).
- Max suggestions: 3; delay: 250ms
- Enable for code; **disable** for config/secret files.

---

## 3. Individual vs Organization Setup

### Individual
Create `~/.copilot/ethical_guidelines.md` pledge, document AI usage in commits, and prefer **opt‑in** per project.

### Organization
Adopt `.github/copilot-policy.yml` (in this bundle) to enforce disclosure, dual‑signature, security scans, and periodic ethics reviews.

---

## 4. Ethical Usage Guidelines

### Human‑AI Collaboration
- AI **assists**; humans decide.  
- All AI help is **documented** and **explainable**.

### Review Workflow
```
AI Suggestion → Human Review → Security/Ethics Check → Accept with Attribution → Commit (Dual Signature)
```

**Commit Example:**
```
[AI-assisted] Implement user authentication

- Used Copilot for OAuth boilerplate
- Human-reviewed security paths; added rate limiting
- Validated against OWASP guidance

Dual Signature:
- AI: GitHub Copilot
- Human: <Name> <email>
```

### Prompting Pattern
```
Context: ...
Ethics: (privacy, security, inclusivity)...
Requirements: ...
Style: ...
Request: ...
```

---

## 5. Advanced & Best Practices
- Privacy by design; never include keys/PII.  
- Security review for input validation, XSS/SQLi, authz.  
- Accessibility (e.g., WCAG 2.1 AA) for UI work.  
- Energy‑aware designs where feasible.

---

## 6. Troubleshooting & Support
- Re‑authenticate Copilot; check subscription; verify file types; network/proxy.  
- If unsafe suggestions occur: **reject → document → report → correct**.

---

## 7. Accountability Framework
Levels 1–3 from basic to critical; require increasingly strict review and signatures.  
Integrate with pre‑commit hooks to enforce policy (see repository’s tooling).

---

**AI Signature & Accountability:** GitHub Copilot (AI Capabilities), ChatGPT (Rhythm‑Mind)  
**Human Guardian:** Seed‑bringer hannesmitterer  
**Part of:** Euystacio‑Helmi AI Living Documentation  
**Last Updated:** 2025‑08‑25  
**Version:** Comprehensive v0.2
