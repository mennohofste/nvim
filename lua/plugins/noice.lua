return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  ---@module "noice"
  ---@type NoiceConfig
  opts = {
    presets = {
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
