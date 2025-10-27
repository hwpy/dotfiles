-- treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "python", "go", "gomod" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- дополнительные фичи для python:
    indent = { enable = true },  -- автоматические отступы
    context_commentstring = { enable = true },  -- умные комментарии
  },
}
