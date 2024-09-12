return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      pickers = { buffers = { ignore_current_buffer = true, sort_mru = true } },
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>,", builtin.buffers, {})
  end,
}
