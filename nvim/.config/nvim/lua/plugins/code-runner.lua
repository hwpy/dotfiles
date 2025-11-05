return {
  "CRAG666/code_runner.nvim",
  opts = {
    filetype = {
      python = function()
        local python_file = vim.fn.expand("%:p")
        return 'python -u ' .. vim.fn.shellescape(python_file)
      end,
      go = function()
        local dir = vim.fn.expand("%:p:h")
        return "go run " .. vim.fn.shellescape(dir)
      end,
    },
    term = {
      position = "bot",
      size = 15
    }
  },
  keys = {
    { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" }
  }
}


-- 2.2 Запуск Python-кода с поддержкой .env (без direnv)
-- return {
--   "CRAG666/code_runner.nvim",
--   opts = {
--     filetype = {
--       python = function()
--         local env = vim.fn.findfile(".env", ".;")
--         return string.format(
--           env ~= "" and 'bash -c "set -a; source %s; set +a; python -u %s"' or 'python -u %s',
--           vim.fn.shellescape(vim.fn.fnamemodify(env, ":p")),
--           vim.fn.shellescape(vim.fn.expand("%:p"))
--         )
--       end
--     },
--     term = { position = "bot", size = 10 }
--   },
--   keys = { { "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code (.env)" } }
-- }
