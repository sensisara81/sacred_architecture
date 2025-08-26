-- Euystacio‑Helmi AI — Ethical Copilot for Neovim
vim.g.copilot_assume_mapped = true
vim.g.copilot_enabled = false
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
