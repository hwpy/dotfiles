return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("configs.luasnip").config()
  end,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}
