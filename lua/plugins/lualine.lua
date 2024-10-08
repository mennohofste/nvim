return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_x = {
        "filetype",
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        },
      },
    },
  },
  config = function(_, opts)
    -- Do not show mode since lualine already shows status
    vim.opt.showmode = false
    require("lualine").setup(opts)
  end,
}
