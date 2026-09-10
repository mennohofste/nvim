vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.colorcolumn = "100"
vim.opt.list = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Diagnostic
vim.diagnostic.config({ virtual_lines = { current_line = true } })
