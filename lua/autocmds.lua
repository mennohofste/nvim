-- Save last buffer location
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Treesitter highlight
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  callback = function(ev)
    local ts = require("nvim-treesitter")
    local lang = vim.treesitter.language.get_lang(ev.match)

    -- Only deal with available langs
    if not vim.tbl_contains(ts.get_available(), lang) then
      return
    end

    -- Install if not installed
    if not vim.tbl_contains(ts.get_installed(), lang) then
      ts.install(lang):await(function()
        vim.treesitter.start(ev.buf, lang)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end)
      return
    end

    vim.treesitter.start(ev.buf, lang)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
