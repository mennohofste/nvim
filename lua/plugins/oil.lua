return {
  "stevearc/oil.nvim",
  lazy = false,
  ---@module "oil"
  ---@type oil.SetupOpts
  opts = { view_options = { show_hidden = true } },
  keys = { { "-", "<CMD>Oil<CR>", desc = "Open parent directory" } },
}
