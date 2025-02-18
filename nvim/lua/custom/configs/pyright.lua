local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Настройка pyright
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        typeCheckingMode = "strict", -- Строгая проверка типов
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        ignore = { '*' },
      },
    },
  },
})
