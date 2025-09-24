-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "html", "cssls", "lua_ls", "pyright", "ruff" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Pyright config
vim.lsp.config("pyright", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "openFilesOnly",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      },
    },
  },
})

-- Ruff config
vim.lsp.config("ruff", {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
  root_dir = require("lspconfig.util").root_pattern(".git"),
  init_options = {
    settings = {
      args = {
        "--config", vim.fn.expand("~/.config/ruff/pyproject.toml"),
      },
    },
  },
})

vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- Setup DAP for Python
-- require('dap-python').setup(vim.fn.exepath('python'))
