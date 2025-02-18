return {
  {
    "tpope/vim-fugitive",  -- Плагин для интеграции Git
    lazy = false,          -- Загружать сразу (не лениво)
    cmd = { "Git", "Gstatus", "Gcommit" }, -- Команды для активации
  },
}
