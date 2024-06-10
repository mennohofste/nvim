vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- Indent rules
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.smartindent = true -- Insert indents automatically
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent

-- Cursor
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Enable highlighting of the current line
opt.scrolloff = 4 -- Lines of context
opt.colorcolumn = "80" -- Ruler

-- Visual
opt.termguicolors = true -- True color support
opt.list = true -- Show some invisible characters (tabs...
opt.wrap = false

-- System
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- Confirm to before exiting modified buffer
opt.undofile = true
opt.undolevels = 10000
