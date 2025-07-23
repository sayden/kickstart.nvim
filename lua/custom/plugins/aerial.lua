-- MARIO: Aerial - Code outline

return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      post_add_all_symbols = function(bufnr, items, ctx)
        local function sort_items(items)
          table.sort(items, function(a, b)
            return a.name:lower() < b.name:lower()
          end)
          for _, item in ipairs(items) do
            if item.children then
              sort_items(item.children)
            end
          end
          return items
        end
        return sort_items(items)
      end,
      -- Jump forward and backward
      keymaps = {
        jump = { '<C-j>', '<C-e>' },
        jump_back = { '<C-k>', '<C-u>' },
      },
      backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
      min_width = 20,
      filter_kind = {
        'Class',
        'Constructor',
        'Enum',
        'Function',
        'Interface',
        'Module',
        'Method',
        'Struct',
      },
      -- Jump to symbol in source window when the cursor moves
      autojump = false,
      -- Show box drawing characters for the tree hierarchy
      show_guides = true,
    }

    vim.keymap.set('n', '<leader>ae', ':AerialToggle<CR>', { silent = true, desc = 'Toggle Aerial' })
    vim.keymap.set('n', '<leader>cs', ':Telescope aerial<CR>', { desc = '[C]ode [S]ymbols' })
  end,
}
