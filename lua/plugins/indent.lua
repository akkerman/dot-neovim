return {
  {
    "tpope/vim-sleuth",
    event = "BufReadPre", -- Load before reading files
    config = function()
      -- Vim-Sleuth works automatically and doesn't require much configuration
      -- but you can tweak these settings if you need.

      -- Optional: Customize indentation settings manually, if needed
      -- vim.cmd [[
      --   let g:sleuth_autoindent = 1   " Enable auto indentation detection
      -- ]]

      -- Example: If you want to change the default behavior, you can adjust it
      -- vim.api.nvim_set_var("sleuth_autoindent", 1)
    end,
  },
}
