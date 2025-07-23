-- Smooth scrolling
return {
  'karb94/neoscroll.nvim',
  config = function()
    local neoscroll = require 'neoscroll'
    neoscroll.setup { mappings = { 'zz', 'zb', 'zt' } }
    local keymap = {
      ['<C-u>'] = function()
        neoscroll.scroll(-20, { duration = 150, easing = 'sine' })
      end,
      ['<C-e>'] = function()
        neoscroll.scroll(20, { duration = 150, easing = 'sine' })
      end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
