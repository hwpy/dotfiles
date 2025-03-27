require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>pv", "<cmd>VenvSelect<cr>", { desc = "Select Python Venv" })

map("n", "<leader>rf", function()
  -- Запускаем ruff для форматирования текущего файла через команду консоли
  vim.cmd("!ruff check --select I --fix %")
  vim.cmd("!ruff format %")
  vim.cmd("edit")  -- Перезагружает текущий файл в буфере
  -- После этого перезагружаем файл или применяем форматирование через LSP (если нужно)
  vim.lsp.buf.format({ async = false })
end, { desc = "Format current file with ruff" })

-- Рефакторинг через LSP
map("n", "<F2>", function()
  if vim.lsp.buf.rename then
    vim.lsp.buf.rename()
  else
    vim.notify("LSP rename not available", vim.log.levels.WARN)
  end
end, { desc = "Rename symbol (F2 hotkey)" })

map("n", "<leader>q", vim.lsp.buf.code_action, { desc = "Quick Fix" })

map('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })
map('n', '<leader>tn', ':tabnew<CR>', { desc = 'Open new tab' })
