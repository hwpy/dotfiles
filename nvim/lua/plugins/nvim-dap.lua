return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Основные маппинги
    map("n", "<F5>", function() dap.continue() end, opts)
    map("n", "<F10>", function() dap.step_over() end, opts)
    map("n", "<F11>", function() dap.step_into() end, opts)
    map("n", "<F12>", function() dap.step_out() end, opts)
    map("n", "<F9>", function() dap.toggle_breakpoint() end, opts)

    map("n", "<Leader>dr", function() dap.repl.open() end, opts)
    map("n", "<Leader>dl", function() dap.run_last() end, opts)
    map("n", "<Leader>du", function() dapui.toggle() end, opts)
    map("n", "<Leader>dv", function() dapui.eval() end, opts)
    map("n", "<Leader>dq", function()
      dap.terminate()
      dapui.close()
    end, opts)
  end,
}

