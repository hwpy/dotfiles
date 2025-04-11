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
map('n', '<leader>cp', ':let @+ = expand("%:p")<CR>>', { desc = 'Copy file path' })

local function setup_instant_resize()
  local function resize_notify(direction, step)
    return function()
      local cmd = direction == "vertical"
        and "vertical resize " .. (vim.fn.winwidth(0) + step)
        or "resize " .. (vim.fn.winheight(0) + step)

      vim.cmd(cmd)
      vim.notify(
        direction == "vertical"
          and ("Ширина: " .. vim.fn.winwidth(0))
          or ("Высота: " .. vim.fn.winheight(0)),
        vim.log.levels.INFO,
        { title = "Размер окна", timeout = 500 }
      )
    end
  end

  -- Вертикальный ресайз (ширина)
  vim.keymap.set("n", "<A-S-h>", resize_notify("vertical", -5), { desc = "Уменьшить ширину на 10" })
  vim.keymap.set("n", "<A-S-l>", resize_notify("vertical", 5), { desc = "Увеличить ширину на 10" })

  -- Горизонтальный ресайз (высота)
  vim.keymap.set("n", "<A-S-j>", resize_notify("horizontal", -5), { desc = "Уменьшить высоту на 10" })
  vim.keymap.set("n", "<A-S-k>", resize_notify("horizontal", 5), { desc = "Увеличить высоту на 10" })
end

setup_instant_resize()

-- Alt+Shift+h/l - ширина
-- Alt+Shift+j/k - высота

-- Markdown-специфичные маппинги
map("n", "<leader>mt", function()
  require("render-markdown").toggle()
end, { desc = "Toggle Markdown Render" })
