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
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.schedule(function()
        vim.api.nvim_set_hl(0, "TelescopeSelection", {
          bg = "#746DFE",  -- 👈 можешь сюда вставить свой цвет
          bold = true,
        })
      end)
    end,
  },
  -- Выбор venv
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
  -- {
  --   "direnv/direnv.vim",
  --   config = function()
  --     vim.g.direnv_auto = 1       -- Автозагрузка при входе в директорию
  --     vim.g.direnv_silent = 1     -- Без уведомлений
  --   end
  -- },
  -- 2.1 Запуск Python-кода с поддержкий .env (через direnv)
  {
  "CRAG666/code_runner.nvim",
  opts = {
    filetype = {
      python = function()
        local envrc = vim.fn.findfile(".envrc", ".;")
        local python_file = vim.fn.expand("%:p")

        if envrc ~= "" then
          -- 1. Разрешаем .envrc если нужно
          vim.cmd('silent !cd ' .. vim.fn.shellescape(vim.fn.fnamemodify(envrc, ":h")) .. ' && direnv allow')
          -- 2. Запускаем через direnv
          return string.format(
            'bash -c "cd %s && direnv exec . python -u %s"',
            vim.fn.shellescape(vim.fn.fnamemodify(envrc, ":h")),
            vim.fn.shellescape(python_file)
          )
        end
        return 'python -u ' .. vim.fn.shellescape(python_file)
      end
    },
    term = {
      position = "bot",
      size = 15
    }
  },
  keys = {
    { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Python (.envrc)" }
  }
},

  -- 2.2 Запуск Python-кода с поддержкой .env (без direnv)
  -- {
  --   "CRAG666/code_runner.nvim",
  --   opts = {
  --     filetype = {
  --       python = function()
  --         local env = vim.fn.findfile(".env", ".;")
  --         return string.format(
  --           env ~= "" and 'bash -c "set -a; source %s; set +a; python -u %s"' or 'python -u %s',
  --           vim.fn.shellescape(vim.fn.fnamemodify(env, ":p")),
  --           vim.fn.shellescape(vim.fn.expand("%:p"))
  --         )
  --       end
  --     },
  --     term = { position = "bot", size = 10 }
  --   },
  --   keys = { { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Python (.env)" } }
  -- },

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
        width = 50,
      },
      filters = {
        dotfiles = false,  -- Показывать скрытые файлы (начинающиеся с .)
        custom = { "^onedrive$", "^icloud$" },
      },
      git = {
        ignore = false,     -- Показывать файлы, игнорируемые git
      },
    },
  },

  -- для подсветки python кода treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Дополнительные фичи для Python:
      indent = { enable = true },  -- автоматические отступы
      context_commentstring = { enable = true },  -- умные комментарии
    },
  },

  -- для скобок
  {
    "HiPhish/rainbow-delimiters.nvim",  -- разноцветные скобки
    event = "BufRead",
    config = function()
      local rainbow = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow.strategy["global"],
          python = rainbow.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          python = "rainbow-parens",  -- специально для Python
        },
      }
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs.luasnip").config()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    opts = {}
  },

  require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  },
}
