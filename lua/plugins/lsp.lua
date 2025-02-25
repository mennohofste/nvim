return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(event)
        local map = function(keys, func)
          vim.keymap.set("n", keys, func, { buffer = event.buf })
        end

        map("grn", vim.lsp.buf.rename)
        map("gra", vim.lsp.buf.code_action)
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "basedpyright",
        "ruff",
        "rust_analyzer",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
        ["ruff"] = function()
          require("lspconfig").ruff.setup({
            capabilities = capabilities,
            on_attach = function(client, _)
              client.server_capabilities.hoverProvider = false
            end,
          })
        end,
        ["rust_analyzer"] = function()
          require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = function(_, bufnr)
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
          })
        end,
      },
    })
  end,
}
