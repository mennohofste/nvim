vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

local spec_treesitter = require("mini.ai").gen_spec.treesitter
require("mini.ai").setup({
  n_lines = 500,
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

vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files (cwd)" })
