-- git diff
-- зависимость neogit
return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true, -- Базовая настройка
  version = "v2.*", -- Фиксируем версию
  cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- Ленивая загрузка
  keys = {
    { "<leader>gt", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" }
  }
}
