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
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        -- signs = {
        --   add          = { text = '+' },
        --   change       = { text = '~' },
        --   delete       = { text = '_' },
        --   topdelete    = { text = '‾' },
        --   changedelete = { text = '~' },
        -- },
        current_line_blame = true,  -- Включить отображение информации о коммите в текущей строке
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',  -- Отображать информацию в конце строки
          delay = 1000,           -- Задержка перед отображением (в миллисекундах)
          ignore_whitespace = false,
        },
        on_attach = function(bufnr)
          -- Ключевые mapping'и (опционально)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })

          vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, buffer = bufnr })
        end,
      })
    end,
  },
}
