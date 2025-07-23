-- [[ Copilot ]] -----------------------------------------------------------------------------------

vim.g.copilot_enabled = 0
vim.keymap.set('n', '<leader>co', ':Copilot<CR>', { silent = true, desc = 'Open Copilot' })
vim.keymap.set('i', '<c-i>', '<Plug>(copilot-next)', { silent = true, desc = 'Next suggestion' })
vim.keymap.set('i', '<C-p>', '<Plug>(copilot-suggest)', { silent = true, expr = true, desc = 'Suggest' })

return {
  'github/copilot.vim',
}
