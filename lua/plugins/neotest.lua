return {
  "nvim-neotest/neotest",
  opts = {
    adapters = {
      ["neotest-python"] = {
        args = { "--log-level", "DEBUG", "-v" },
        runner = "pytest",
        python = function()
          return require("venv-selector").get_active_path() or os.getenv("CONDA_PREFIX") .. "/bin/python"
        end,
      },
    },
  },
}
