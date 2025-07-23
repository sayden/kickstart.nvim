-- MARIO: Tab management
return {
  'romgrk/barbar.nvim',

  commit = '40c176c9af7e9aefe3af9ec9d985a3edb50d66a3',
  branch = 'master',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = true
  end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here,
    -- anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  -- version = '^1.9.0', -- optional: only update when a new 1.x version is released
}
