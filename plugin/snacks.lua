vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  dashboard = {
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  statuscolumn = { enabled = true },
})

local map = vim.keymap.set
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
map("n", "<leader>gl", function()
  Snacks.lazygit.log()
end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>gf", function()
  Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })

map("n", "<leader>f", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "grr", function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
map("n", "gri", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gO", function()
  Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
