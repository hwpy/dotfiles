-- требуется установка delve через Mason
return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap = require("dap")
    local dapgo = require("dap-go")

    dapgo.setup()

    dap.configurations.go = {
      {
        type = "go",
        name = "Debug File",
        request = "launch",
        program = "${file}",
        console = "integratedTerminal",
      },
      {
        type = "go",
        name = "Debug Package",
        request = "launch",
        program = "${workspaceFolder}",
        console = "integratedTerminal",
      },
      {
        type = "go",
        name = "Debug Test File",
        request = "launch",
        mode = "test",
        program = "${file}",
        console = "integratedTerminal",
      },
      {
        type = "go",
        name = "Debug Test Package",
        request = "launch",
        mode = "test",
        program = "${workspaceFolder}",
        console = "integratedTerminal",
      },
    }
  end,
}

