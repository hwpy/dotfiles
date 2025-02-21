local map = vim.keymap.set

-- Маппинг jj на переход в нормальный режим
map("i", "jj", "<Esc>", { noremap = true, silent = true })

