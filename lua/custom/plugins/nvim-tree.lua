-- Left file browser
return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    filters = {
      custom = { 'node_modules', '.git/', '.cache', 'go.sum', '.import', '.uid' },
      dotfiles = false,
    },
    view = {
      adaptive_size = true,
    },
    update_focused_file = {
      enable = true,
    },
    on_attach = function(bufnr)
      -- custom mappings
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return {
          desc = 'nvim-tree: ' .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- default mappings DO NOT add default mappings or they'll override the ones from colemak
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', 'j', api.tree.change_root_to_parent, opts 'Up')
      vim.keymap.set('n', 'k', api.tree.change_root_to_node, opts 'CD')

      vim.keymap.set('n', '-', 'N', opts 'Nothing')

      vim.keymap.set('n', 'i', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', 'n', api.node.open.edit, opts 'Close')

      vim.keymap.del('n', '<C-e>', opts 'Open in place')

      vim.keymap.del('n', '<C-v>', opts 'Vsplit')
      vim.keymap.set('n', '<C-I>', api.node.open.vertical, opts 'Open in a vertical split')

      vim.keymap.del('n', '<C-x>', opts 'Hsplit')
      vim.keymap.set('n', 'E', api.node.open.horizontal, opts 'Open in a horizontal split')

      vim.keymap.set('n', 'u', 'k', opts 'Move up')
      vim.keymap.set('n', 'U', '7k', opts 'Move up 15')
      vim.keymap.set('n', 'e', 'j', opts 'Move down')
      vim.keymap.set('n', 'E', '7j', opts 'Move down 15')

      vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
    end,
  },
}
