require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Преобразовывать CRLF -> LF при вставке
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.fn.setreg('"', vim.fn.substitute(vim.fn.getreg('"'), '\r\n', '\n', 'g'))
  end
})
