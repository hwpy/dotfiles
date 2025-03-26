return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
    {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      post_hook = function()
        if vim.fn.filereadable(".env") == 1 then
          vim.cmd('silent !source .env')
        end
      end
    },
    branch = "regexp",
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
  },
  -- 1. Автозагрузка .env через direnv (универсально для всех языков)
  {
    "direnv/direnv.vim",
    config = function()
      vim.g.direnv_auto = 1       -- Автозагрузка при входе в директорию
      vim.g.direnv_silent = 1     -- Без уведомлений
    end
  },

  -- 2. Запуск Python-кода с поддержкой .env
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        python = "env $(grep -v '^#' .env | xargs) python $file"
      },
    },
    keys = {
      { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Python (with .env)" }
    }
  },

  -- 3. Дополнительно: визуализация .env-переменных
  {
    "tomiis4/Hypersonic.nvim",
    ft = "python",
    opts = {
      show_env = true  -- Подсветка переменных из .env в коде
    }
  },

  -- git
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- Базовая настройка
    version = "v2.*", -- Фиксируем версию
    cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- Ленивая загрузка
    keys = {
      { "<leader>gt", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" }
    }
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim" -- Для интеграции
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" }
    },
    opts = {
      integrations = { diffview = {lazy_load = false} }
    }
  },
  
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,  -- Показывать скрытые файлы (начинающиеся с .)
      },
      git = {
        ignore = false,     -- Показывать файлы, игнорируемые git
      },
    },
  },

  require('gitsigns').setup {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  },

}
