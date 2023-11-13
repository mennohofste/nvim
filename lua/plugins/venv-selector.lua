return {
  "linux-cultist/venv-selector.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("nvim-dap-python") then
      opts.dap_enabled = true
    end

    -- Functions necessary for keeping other settings such as root dir
    local function execute_for_client(name, callback)
      local dbg = require("venv-selector.utils").dbg
      local client = vim.lsp.get_active_clients({ name = name })[1]

      if not client then
        dbg("No client named: " .. name .. " found")
        return
      end

      callback(client)
    end
    local function pyright_hook(_, venv_python)
      execute_for_client("pyright", function(pyright)
        pyright.config.settings =
          vim.tbl_deep_extend("force", pyright.config.settings, { python = { pythonPath = venv_python } })
        pyright.notify("workspace/didChangeConfiguration", { settings = nil })
      end)
    end

    return vim.tbl_deep_extend("force", opts, {
      name = { "venv", ".venv", "env", ".env" },
      anaconda_base_path = "/Users/mennohofste/miniconda3",
      anaconda_envs_path = "/Users/mennohofste/miniconda3/envs",
      parents = 0,
      changed_venv_hooks = { pyright_hook },
    })
  end,
}
