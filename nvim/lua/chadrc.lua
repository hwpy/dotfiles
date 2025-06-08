-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "ayu_dark",
  transparency = true,
  -- настройки конкретно для statusline theme = "vscode_colored"
  hl_override = {
    St_cwd = {},
    St_NormalMode = {},
    St_VisualMode = {},
    St_InsertMode = {},
    St_TerminalMode = {},
    St_NTerminalMode = {},
    St_ReplaceMode = {},
    St_ConfirmMode = {},
    St_CommandMode = {},

    TbCloseAllBufsBtn = {fg="pink"},
    TbThemeToggleBtn = {fg="pink"},
    TBTabTitle = {fg="purple"},
    TbTabCloseBtn = {fg="purple"},
    TbTabOff = {},
    TbTabOn = {fg="pink"},
    TbTabNewBtn = {},
  },
  -- настройки конкретно для statusline theme = "vscode_colored"

    -- hl_override = {
    --     Comment = { italic = true },
    --     ["@comment"] = { italic = true },
    -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}


-- настройки конкретно для statusline theme = "vscode_colored"
-- Устанавливаем прозрачность для всех элементов
for _, hl in pairs(M.base46.hl_override) do
  hl.bg = "none"
end
-- настройки конкретно для statusline theme = "vscode_colored"

M.ui = {
  statusline = {
    theme = "vscode_colored",  -- Доступные темы: "default", "vscode_colored", "minimal"
    separator_style = "block",  -- Стили разделителей: "round", "block", "arrow", "slant"
    -- Опционально: кастомизация модулей
    overriden_modules = nil     -- Можно добавить свою логику при необходимости
  },
}

M.mason = {
  pkgs = {
    "gopls",
    "golangci-lint",
    "golangci-lint-langserver",
    "goimports",
    "gofumpt",
  }
}

return M
