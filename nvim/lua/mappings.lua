require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- выбор venv
map("n", "<leader>pv", "<cmd>VenvSelect<cr>", { desc = "Select Python Venv" })

-- форматирование через LSP
map("n", "<leader>rf", function()
  vim.lsp.buf.format { filter = function(client) return client.name == "ruff" end }
end, { desc = "Format current file with Ruff" })
map("n", "<leader>q", vim.lsp.buf.code_action, { desc = "Quick Fix" })

-- рефакторинг через LSP
map("n", "<F2>", function()
  if vim.lsp.buf.rename then
    vim.lsp.buf.rename()
  else
    vim.notify("LSP rename not available", vim.log.levels.WARN)
  end
end, { desc = "Rename symbol (F2 hotkey)" })

-- управление вкладками
map('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })
map('n', '<leader>tn', ':tabnew<CR>', { desc = 'Open new tab' })
map('n', '<leader>cp', ':let @+ = expand("%:p")<CR>>', { desc = 'Copy file path' })

-- изменение размеров терминала
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

  -- вертикальный ресайз (ширина)
  vim.keymap.set("n", "<A-S-h>", resize_notify("vertical", -5), { desc = "Уменьшить ширину на 5" })
  vim.keymap.set("n", "<A-S-l>", resize_notify("vertical", 5), { desc = "Увеличить ширину на 5" })

  -- горизонтальный ресайз (высота)
  vim.keymap.set("n", "<A-S-j>", resize_notify("horizontal", -5), { desc = "Уменьшить высоту на 5" })
  vim.keymap.set("n", "<A-S-k>", resize_notify("horizontal", 5), { desc = "Увеличить высоту на 5" })
end

setup_instant_resize()

-- Alt+Shift+h/l - ширина
-- Alt+Shift+j/k - высота

-- markdown маппинги
map("n", "<leader>mt", function()
  require("render-markdown").toggle()
end, { desc = "Toggle Markdown Render" })
map('n', '<leader>mf', ':lua require("nabla").popup()<CR>', { desc = 'Markdown Formula' })
