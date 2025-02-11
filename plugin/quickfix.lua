vim.api.nvim_create_autocmd("QuickFixCmdPre", {
  pattern = "*",
  callback = function()
    vim.cmd("packadd cfilter")
  end,
})
