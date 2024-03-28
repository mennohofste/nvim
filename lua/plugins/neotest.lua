return {
  "nvim-neotest/neotest",
  opts = {
    adapters = {
      ["neotest-python"] = {
        dap = { justMyCode = false },
        args = { "--log-level", "DEBUG" },
        runner = "pytest",
        python = function()
          return require("venv-selector").get_active_path() or os.getenv("CONDA_PREFIX") .. "/bin/python"
        end,
        pytest_discover_instances = true,
      },
    },
  },
}
