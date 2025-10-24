-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("nvchad.configs.lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "lua_ls", "pyright", "ruff", "golsp" }
local nvlsp = require("nvchad.configs.lspconfig")

vim.lsp.enable(servers)


-- lsps with default config
for _, lsp in ipairs(servers) do
  -- lspconfig[lsp].setup {
  vim.lsp.config(lsp, { -- nvim 0.11
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
      }
    }
  }
})

-- Ruff config
vim.lsp.config("ruff",  {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
  -- root_dir = lspconfig.util.root_pattern(".git"),
  init_options = {
    settings = {
      args = {
        "--config", "~/.config/ruff/pyproject.toml"  -- путь по умолчанию
      }
    }
  }
})

vim.lsp.config("golsp", {
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
