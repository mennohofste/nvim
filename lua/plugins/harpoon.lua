return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>M", function() require("harpoon"):list():add() end },
    { "<leader>m", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
    { "<leader>1", function() require("harpoon"):list():select(1) end },
    { "<leader>2", function() require("harpoon"):list():select(2) end },
    { "<leader>3", function() require("harpoon"):list():select(3) end },
    { "<leader>4", function() require("harpoon"):list():select(4) end },
    { "<leader>5", function() require("harpoon"):list():select(5) end },
  },
}
