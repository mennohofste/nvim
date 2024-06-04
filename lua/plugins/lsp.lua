local setup_lsp_keybinds = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
      map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
      map("gy", require("telescope.builtin").lsp_type_definitions, "[G]oto T[y]pe")
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      map("<leader>s", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")
      map("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace [S]ymbols")
      map("<leader>r", vim.lsp.buf.rename, "[R]ename")
      map("<leader>a", vim.lsp.buf.code_action, "Code [A]ction")
      map("K", vim.lsp.buf.hover, "Hover Documentation")

      map("<leader>c", vim.diagnostic.open_float, "Hover Documentation")
      map("<C-q>", vim.diagnostic.setqflist, "Quickfix list")

      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf })

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("UserLspConfigDetach", { clear = true }),
          callback = function(e)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "UserLspConfig", buffer = e.buf })
          end,
        })
      end

      if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
        end, "[T]oggle Inlay [H]ints")
      end
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    setup_lsp_keybinds()

    local servers = {
      basedpyright = { settings = { python = { pythonPath = os.getenv("CONDA_PREFIX") .. "/bin/python" } } },
      ruff = {
        on_attach = function(client, _)
          client.server_capabilities.hoverProvider = false
        end,
      },
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "basedpyright",
        "ruff",
        "yamlls",
      },
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = capabilities
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
