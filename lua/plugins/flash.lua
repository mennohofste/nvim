return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = { modes = { search = { enabled = true } } },
  keys = {
    {
      "<C-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
