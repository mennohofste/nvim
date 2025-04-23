return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = false,
      ensure_installed = {
        "basedpyright",
        "ruff",
        "rust_analyzer",
      },
      handlers = {
        function(server_name)
          vim.lsp.enable(server_name)
        end,
      },
    })
  end,
}
