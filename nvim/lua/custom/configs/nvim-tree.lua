require("nvim-tree").setup({
    sync_root_with_cwd = true,
    filters = {
      dotfiles = false,  -- Показывать dotfiles (файлы, начинающиеся с точки)
      custom = {},       -- Пользовательские фильтры (если есть)
      exclude = {},      -- Исключить определенные файлы или директории
    },
    git = {
     enable = true,     -- Включить интеграцию с Git
     ignore = false,    -- Не игнорировать файлы из .gitignore
    },
})

