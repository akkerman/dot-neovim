vim.api.nvim_create_user_command("Scratch", function(opts)
  vim.cmd("new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
end, {})

local map = vim.keymap.set
map("n", "<leader>x", ":Scratch<CR>") -- Map the command to a keybinding
map("n", "<leader>J", 'yy:Scratch<CR>p:%!jq "."<CR>:set ft=json<CR>') -- Map the command to a keybinding
