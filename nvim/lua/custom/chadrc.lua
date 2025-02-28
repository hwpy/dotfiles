
---@type ChadrcConfig
local M = {}

M.mason = {
  pkgs = {
    "pyright",
    "ruff",
  },
}

-- Настройка терминалов через NvChad API
M.term = {
  terminals = {
    type = "float", -- дефолтный тип терминала
    position = "center",
  },

  new_term = function(term_type)
    -- Автоматическое определение корня проекта
    local root_dir = require("nvchad.term.utils").get_project_root()
    vim.cmd("cd " .. vim.fn.fnameescape(root_dir))
    
    -- Создание терминала с учетом типа
    require("nvchad.term").new(
      term_type == "float" and {}
        or { pos = term_type .. "sp", size = term_type == "h" and 0.3 or 0.4 }
    )
  end
}

-- Оптимизированные маппинги
M.mappings = {
  custom = {
    n = {
      ["<leader>h"] = {
        function() M.term.new_term("h") end,
        "Открыть горизонтальный терминал в проекте",
        { nowait = true }
      },
      ["<leader>v"] = {
        function() M.term.new_term("v") end,
        "Открыть вертикальный терминал в проекте",
        { nowait = true }
      },
    },
  },
}

-- Настройки Git
M.git = {
  n = {
    ["<leader>gt"] = {
      function()
        -- Открываем список изменённых файлов с помощью Telescope
        require("telescope.builtin").git_status({
          show_untracked = true,
          show_staged = true,
          show_unstaged = true,
        })
      end,
      "Просмотр изменённых файлов в ветке",
    },
  },
}

return M

