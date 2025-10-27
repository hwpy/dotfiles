-- выбор python venv
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    -- "mfussenegger/nvim-dap-python",
  },
  opts = {
    post_hook = function()
      if vim.fn.filereadable(".env") == 1 then
        vim.cmd('silent !source .env')
      end
    end
  },
  event = "BufEnter *.py",  -- Загружать при открытии Python-файлов
  config = function()
    require("venv-selector").setup({
      name = { "venv", ".venv" },  -- Ищет оба варианта папок
      auto_refresh = true,
      parents = 2,  -- Ищет на 2 уровня вверх
      python_bin = "python",
    })
  end,
  init = function()
    -- Принудительная загрузка при старте (если event не сработал)
    vim.schedule(function()
      require("lazy").load({ plugins = { "venv-selector.nvim" } })
    end)
  end,
}
