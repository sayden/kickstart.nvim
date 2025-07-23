return { -- Something to achieve something like AceJump
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    -- keys = 'etovxqpdygfblzhckisuran',
    keys = 'tnseriaodhplufmvckywxbzqjg',
  },
  config = function(_, opts)
    local hop = require 'hop'

    hop.setup {}
    -- vim.keymap.set('', 't', function()
    --   hop.hint_char2 { current_line_only = false }
    -- end, { remap = true, desc = '[Hop] Hint 2 chars' })

    vim.keymap.set('', 't', function()
      -- hop.hint_patterns { current_line_only = false }
      hop.hint_char3 { current_line_only = false }
    end, { remap = true, desc = '[Hop] 3 char hop' })

    -- vim.keymap.set('', 'f', function()
    --   hop.hint_char1 { current_line_only = true }
    -- end, { remap = true, desc = '1 char line hop' })
    -- vim.keymap.set('', 'F', function()
    --   hop.hint_char1 { current_line_only = true }
    -- end, { remap = true, desc = '1 char line hop' })

    vim.wo.scroll = 20
  end,
}
