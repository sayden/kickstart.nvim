-- MARIO: Other ---------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {})
-- To show error messages
vim.keymap.set('n', '<space>E', vim.diagnostic.open_float, { noremap = true, silent = true })
-- Disable auto-commenting next lines
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})
-- Test Go File
vim.api.nvim_set_keymap('n', '<C-t>', ':GoTestFile<CR>', { silent = true })
-- NvimTree (File Explorer)
vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NvimTree' })
-- Telescope (TODO tags finder)
vim.keymap.set('n', '<leader>todo', ':TodoTelescope<CR>', { silent = true, desc = 'Search TODOs' })

return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    -- require('which-key').register {
    --   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    --   ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
    --   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    --   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    --   ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    --   ['<leader>h'] = { name = '[H]Search', _ = 'which_key_ignore' },
    -- }
    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ebug' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = '[H]Search' },
    }
  end,
}
