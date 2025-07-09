local get_dir = require('utils').get_git_root_or_cwd
local nmap = require('utils').nmap

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup()
    nmap("<leader>fep", ":Oil<CR>", "Open parent directory")
    nmap("<leader>fer", function()
      local dir = get_dir()
      require("oil").open(dir)
    end, "Open git root directory")
  end,
}
