local function Jwt(token)
  vim.cmd("new") -- Open a new buffer
  vim.bo.buftype = "nofile" -- Set buffer type to nofile
  vim.bo.bufhidden = "hide" -- Hide buffer when abandoned
  vim.bo.swapfile = false -- Disable swapfile for this buffer
  vim.cmd("r !jwt " .. token) -- Read the decoded JWT output into the buffer
  vim.cmd("set ft=json wrap") -- Set filetype to JSON and enable line wrapping
end

vim.api.nvim_create_user_command("Jwt", function(opts)
  Jwt(opts.args)
end, { nargs = 1 })
