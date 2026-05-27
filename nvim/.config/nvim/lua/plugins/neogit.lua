-- git tool
return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim" -- Для интеграции
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" }
  },
  opts = {
    integrations = { diffview = {lazy_load = false} }
  }
}
