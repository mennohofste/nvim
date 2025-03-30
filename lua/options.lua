vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- Cursor
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Enable highlighting of the current line
opt.scrolloff = 4 -- Lines of context
opt.colorcolumn = "80" -- Ruler

-- Visual
opt.list = true -- Show some invisible characters (tabs...

-- System
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- Confirm to before exiting modified buffer
opt.undofile = true
opt.undolevels = 10000

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Diagnostic
vim.diagnostic.config({ virtual_lines = { current_line = true } })
