-- MARIO: Golang ----------------------------------------------------------------------------------------
return {
  'leoluz/nvim-dap-go',
  event = 'VeryLazy',
  dependencies = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio' },
  config = function()
    require('dap-go').setup()

    local nvim_lsp = require 'lspconfig'
    local go_capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

    local gopls_settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    }

    nvim_lsp['gopls'].setup {
      cmd = { 'gopls' },
      -- on_attach = on_attach,
      capabilities = go_capabilities,
      settings = gopls_settings,
    }
  end,
}
