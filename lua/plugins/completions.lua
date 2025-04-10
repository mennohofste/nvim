return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
      "rafamadriz/friendly-snippets",
    },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = { draw = { treesitter = { "lsp" } } },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
