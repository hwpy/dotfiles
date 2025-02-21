return {
  {
    "tpope/vim-fugitive",  -- Плагин для интеграции Git
    lazy = false,          -- Загружать сразу (не лениво)
    cmd = { "Git", "Gstatus", "Gcommit" }, -- Команды для активации
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", -- Автодополнение из буфера
      "hrsh7th/cmp-path",   -- Автодополнение путей
      "hrsh7th/cmp-nvim-lsp", -- Автодополнение через LSP
      "saadparwaiz1/cmp_luasnip", -- Автодополнение для сниппетов
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
}
