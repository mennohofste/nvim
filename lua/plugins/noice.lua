return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  ---@module "noice"
  ---@type NoiceConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    presets = {
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
