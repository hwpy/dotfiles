return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      width = 50,
    },
    filters = {
      dotfiles = false,  -- Показывать скрытые файлы (начинающиеся с .)
      custom = { "^onedrive$", "^icloud$" },
    },
    git = {
      ignore = false,     -- Показывать файлы, игнорируемые git
    },
  },
}
