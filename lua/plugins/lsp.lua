return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = { python = { pythonPath = os.getenv("CONDA_PREFIX") .. "/bin/python" } },
          root_dir = require("lspconfig").util.find_git_ancestor,
        },
        ruff_lsp = { init_options = { settings = { lint = { args = { "--unsafe-fixes" } } } } },
      },
    },
  },
}
