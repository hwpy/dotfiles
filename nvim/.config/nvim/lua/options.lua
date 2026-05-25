require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
    vim.opt.fileformat = "unix"
    vim.cmd([[%s/\t/    /ge]])
  end
})

-- Преобразовывать CRLF -> LF при вставке
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    local reg = vim.fn.getreg('"')
    reg = vim.fn.substitute(reg, '\r\n', '\n', 'g')
    reg = vim.fn.substitute(reg, '\r', '', 'g')
    vim.fn.setreg('"', reg)
  end
})

vim.opt.relativenumber = true

-- underline cursor
-- vim.opt.guicursor = "a:hor20"
