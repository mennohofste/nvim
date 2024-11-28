return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  ---@module "blink"
  ---@type blink.cmp.Config
  opts = { windows = { documentation = { auto_show = true } } },
}
