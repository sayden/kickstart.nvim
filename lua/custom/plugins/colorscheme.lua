return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  lazy = false,
  opts = {},
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    require('tokyonight').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = false, -- Enable this to disable setting the background color
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true, fg = '#0d8a0b' },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        floats = 'dark', -- style for floating windows
      },
    }
    --   --   -- Load the colorscheme here.
    --   --   -- Like many other themes, this one has different styles, and you could load
    --   --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'tokyonight'
    --   --
    --   --   -- You can configure highlights by doing something like:
    --   -- vim.cmd.hi 'Comment gui=none'
  end,
}
