return {
  'rlane/pounce.nvim',
  config = function()
    require('pounce').setup {
      accept_keys = 'NTESIRLPUFYWMVCX',
    }
    vim.keymap.set('n', 'T', require('pounce').pounce)
  end,
}
