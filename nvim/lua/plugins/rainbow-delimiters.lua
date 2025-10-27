-- цвета скобок
return {
  "HiPhish/rainbow-delimiters.nvim",  -- разноцветные скобки
  event = "BufRead",
  config = function()
    local rainbow = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow.strategy["global"],
        python = rainbow.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        python = "rainbow-parens",  -- специально для Python
      },
    }
  end,
}
