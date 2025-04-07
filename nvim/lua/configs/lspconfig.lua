-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Pyright config
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      }
    }
  }
}

-- Ruff config
lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(
    "pyproject.toml",
    "ruff.toml",
    "settings/pyproject.toml",  -- если конфиг лежит в settings/
    ".git"
  ),
  init_options = {
    settings = {
      args = { "--ignore=E501" }, -- Пример игнорирования ошибок
      format = {
      enabled = true,
      organizeImports = true,
        groupBy = "type" -- Группировка импортов
      },
      lint = {
        select = {"ALL"},
        ignore = {"D400", "D415", "RUF", "COM812", "S608", "ERA001", "PTH109", "INP001"}
      },
      line_length = 100,
      per_file_ignores = {
        ["test.py"] = {"ALL"}
      }
    }
  }
}

-- Setup DAP for Python
require('dap-python').setup(vim.fn.exepath('python'))
