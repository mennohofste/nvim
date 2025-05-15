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
    opts = {
      provider = "qwen3",
      vendors = {
        qwen3 = {
          __inherited_from = "openai",
          api_key_name = "SENSO_QWEN3_API_KEY",
          endpoint = "https://gpu.sensofusion.com:8200/v1",
          model = "Qwen/Qwen3-235B-A22B",
          disable_tools = true,
        },
        qwen25 = {
          __inherited_from = "openai",
          api_key_name = "SENSO_QWEN25_API_KEY",
          endpoint = "https://gpu.sensofusion.com:8100/v1",
          model = "Qwen/Qwen2.5-Coder-32B-Instruct",
          disable_tools = true,
        },
      },
    },
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
