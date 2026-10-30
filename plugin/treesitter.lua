vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
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
