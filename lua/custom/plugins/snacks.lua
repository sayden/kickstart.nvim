return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    picker = {
      enabled = false,
    },
    explorer = {
      enabled = false,
    },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
  },
}
