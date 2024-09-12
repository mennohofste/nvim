return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",
  config = function()
    local ai = require("mini.ai")
    ai.setup({
      n_lines = 500,
      custom_textobjects = {
        -- Object
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        -- Function
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        -- Class
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        -- Digit
        d = { "%f[%d]%d+" },
        -- Global, whole buffer like `gg` and `G`
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

    require("mini.indentscope").setup({ symbol = "│", options = { try_as_border = true } })
    require("mini.surround").setup()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
