return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local servers = {
      basedpyright = {},
      ruff = {
        on_attach = function(client, _)
          -- Pyright provides hover
          client.server_capabilities.hoverProvider = false
        end,
      },
      rust_analyzer = {
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
      },
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = false,
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local config = servers[server_name] or {}
          vim.lsp.config(server_name, config)
          vim.lsp.enable(server_name)
        end,
      },
    })
  end,
}
