local on_attach = require('nvchad_ui.lsp').on_attach
local capabilities = require('nvchad_ui.lsp').capabilities

local lspconfig = require 'lspconfig'
lspconfig.clangd.setup {
  on_attach = function(client, bufr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufr)
  end,
  capabilities = capabilities,
  cmd = { 'clangd', '--background-index' },
}
