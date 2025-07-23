-- Zig

return {
  'ziglang/zig.vim',
  'NTBBloodbath/zig-tools.nvim',
  on_setup = function()
    require('lspconfig').zls.setup {}
    vim.g.zig_fmt_autosave = 0
  end,
}
