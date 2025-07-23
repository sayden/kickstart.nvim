-- Go to Github line -------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>gf', ':OpenInGHFile <CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>gf', ':OpenInGHFileLines <CR>', { silent = true, noremap = true })

return { -- MARIO: Select a line of code and jump to it's github location
  'almo7aya/openingh.nvim',
}
