return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = "rafamadriz/friendly-snippets",
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = { draw = { treesitter = { "lsp" } } },
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
    },
  },
}
