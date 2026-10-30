vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

local servers = {
  basedpyright = {
    on_attach = function(_, bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
  },
  clangd = {
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
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim", "require" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    },
  },
}

for server_name, config in pairs(servers) do
  vim.lsp.config(server_name, config)
  vim.lsp.enable(server_name)
end

require("mason").setup()
require("mason-lspconfig").setup()
