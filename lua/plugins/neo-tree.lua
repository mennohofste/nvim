return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    local command = require("neo-tree.command")
    vim.keymap.set("n", "<leader>e", function()
      command.execute({ toggle = true })
    end, {})
  end,
}
