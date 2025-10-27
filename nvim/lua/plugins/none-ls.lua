-- для подключения инструментов диагностики кода
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Python
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.diagnostics.ruff,
        -- Go
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.diagnostics.golangci_lint,
      },
    })
  end,
}
