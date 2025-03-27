local M = {}

M.config = function()
  local ls = require("luasnip")

  -- Загрузка сниппетов
  require("luasnip.loaders.from_lua").lazy_load({
    paths = {
      vim.fn.stdpath("config") .. "/snippets",
    }
  })

  -- Настройки горячих клавиш
  vim.keymap.set({"i", "s"}, "<C-l>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({"i", "s"}, "<C-h>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })
end

return M
