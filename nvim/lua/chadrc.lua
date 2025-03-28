-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chadracula-evondev",
  transparency = true,
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

M.ui = {
  statusline = {
    theme = "minimal",  -- Доступные темы: "default", "vscode_colored", "minimal"
    separator_style = "block",  -- Стили разделителей: "round", "block", "arrow", "slant"
    -- Опционально: кастомизация модулей
    overriden_modules = nil     -- Можно добавить свою логику при необходимости
  },
}

return M
