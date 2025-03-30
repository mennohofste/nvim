return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  ---@module "nvim-treesitter"
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
