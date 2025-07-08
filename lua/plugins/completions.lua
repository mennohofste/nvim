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
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {},
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
      "Kaiser-Yang/blink-cmp-avante",
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
        default = { "avante", "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
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
