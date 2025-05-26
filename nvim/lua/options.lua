require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
    vim.opt.fileformat = "unix"
  end
})

-- Преобразовывать CRLF -> LF при вставке
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.fn.setreg('"', vim.fn.substitute(vim.fn.getreg('"'), '\r\n', '\n', 'g'))
  end
})

-- Убираем ^M (Carriage Return) после вставки текста из буфера обмена
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    local reg = vim.fn.getreg('"')  -- Получаем текст из системного буфера
    -- Заменяем все символы \r на пустую строку (удаляем ^M)
    local fixed_reg = vim.fn.substitute(reg, '\r', '', 'g')
    vim.fn.setreg('"', fixed_reg)  -- Возвращаем исправленный текст в системный буфер
  end
})

-- Замена табуляции на 4 пробела
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\t/    /ge]])
  end,
})

vim.opt.relativenumber = true
