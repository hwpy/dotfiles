-- ~/.config/nvim/lua/lspconfig/ruff.lua
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("lspconfig").ruff.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      args = { "--quiet" },
    },
  },
  settings = {
    lint = {
        dummyVariableRgx= "__.*",
    },
  },
})

