local agents = require("configs.gpagents")

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

  -- цвета для telestope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'jonarrien/telescope-cmdline.nvim' },
    keys = {
      { 'Q', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
      { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension('cmdline')
      vim.schedule(function()
        vim.api.nvim_set_hl(0, "TelescopeSelection", {
          bg = "#746DFE",
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
      -- "mfussenegger/nvim-dap-python",
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
  -- 2.1 Запуск кода с поддержкий .env (через direnv)
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
        end,
        go = function()
          local envrc = vim.fn.findfile(".envrc", ".;")
          local dir = vim.fn.expand("%:p:h")
          if envrc ~= "" then
            vim.cmd('silent !cd ' .. vim.fn.shellescape(vim.fn.fnamemodify(envrc, ":h")) .. ' && direnv allow')
            return string.format(
              'bash -c "cd %s && direnv exec . go run ."',
              vim.fn.shellescape(dir)
            )
          end
          return "go run ."
        end,
      },
      term = {
        position = "bot",
        size = 15
      }
    },
    keys = {
      { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code (.envrc)" }
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
  --   keys = { { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code (.env)" } }
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

  -- для подсветки кода treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "go", "gomod" },
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

  -- markdown math
  {
    "jbyuki/nabla.nvim",
    dependencies = {
        "nvim-neo-tree/neo-tree.nvim",
        "williamboman/mason.nvim",
    },
    lazy = true,

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "latex" },
            auto_install = true,
            sync_install = false,
        })
    end,
  },

  -- для подключения инструментов диагностики кода
  {
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
  },

  -- gp.nvim
  {
    "robitx/gp.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gp").setup({
        agents = agents,
        providers = {
          openai = { disable = true },
          azure = { disable = true },
          copilot = { disable = true },
          pplx = { disable = true },
          googleai = { disable = true },
          anthropic = { disable = true },
          ollama = {
            endpoint = "http://localhost:11434/v1/chat/completions",
          }
        }
      })
    end
  },

  -- avante.nvim
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "ollama",
  --     ollama = {
  --       endpoint = "http://127.0.0.1:11434",
  --       model = "mistral:7b-instruct", -- your desired model (or use gpt-4o, etc.)
  --       timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
  --       temperature = 0.7,
  --       max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
  --       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

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
