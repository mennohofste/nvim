return {
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      -- setup dap config by VsCode launch.json file
      require("dap.ext.vscode").load_launchjs()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ---@class SetupOpts
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python", { include_configs = false })
    end,
  },
}
