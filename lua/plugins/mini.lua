return {
  "echasnovski/mini.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  event = "VeryLazy",
  config = function()
    local spec_treesitter = require("mini.ai").gen_spec.treesitter
    require("mini.ai").setup({
      custom_textobjects = {
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line("$"),
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
    })

    require("mini.surround").setup()
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = { add = "┃", change = "┃", delete = "▁" },
      },
    })
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()

    require("mini.files").setup({ windows = { preview = true } })
  end,
  -- stylua: ignore
  keys = {
    { "<leader>e", function() MiniFiles.open() end, desc = "Open mini.files (cwd)" },
  },
}
