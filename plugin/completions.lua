vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
  completion = {
    ---@diagnostic disable-next-line: missing-fields
    menu = { draw = { treesitter = { "lsp" } } },
    documentation = { auto_show = true },
    ghost_text = { enabled = true },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
})
