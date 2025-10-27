-- markdown math
return {
  "jbyuki/nabla.nvim",
  dependencies = {
    "nvim-neo-tree/neo-tree.nvim",
    "williamboman/mason.nvim",
  },
  lazy = true,

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "latex" },
      auto_install = true,
      sync_install = false,
    })
  end,
}
