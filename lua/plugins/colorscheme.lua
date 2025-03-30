return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  ---@module "tokyonight"
  ---@type tokyonight.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = { style = "moon" },
  config = function(_, opts)
    local tokyonight = require("tokyonight")
    tokyonight.setup(opts)
    tokyonight.load()
  end,
}
