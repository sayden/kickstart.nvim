return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    labels = 'tnseridhplufmvckywxbzqjgao',
    search = {
      incremental = false,
      autojump = true,
    },
    label = {
      before = true,
      after = false,
      reuse = 'none',
      style = 'overlay',
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      char = {
        keys = {},
      },
    },
  },
  -- stylua: ignore start
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, false },
    -- { 't', mode = { 'n', 'x', 'o' }, false },
    { "t", mode = { "n",'x','o' }, function() require("flash").jump() end, desc = "Flash" },
    { 'S', mode = { 'n', 'o', 'x' }, false },
    { 'r', mode = 'o', false },
    { 'R', mode = { 'o', 'x' }, false },

  },
}
