return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local servers = {
      basedpyright = {
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
      },
      ruff = {
        on_attach = function(client, _)
          -- Pyright provides hover
          client.server_capabilities.hoverProvider = false
        end,
      },
      rust_analyzer = {
        settings = { ["rust-analyzer"] = { check = { command = "clippy" } } },
        on_attach = function(_, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
      },
    }

    for server_name, config in pairs(servers) do
      vim.lsp.config(server_name, config)
      vim.lsp.enable(server_name)
    end

    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}
