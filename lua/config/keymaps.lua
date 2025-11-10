local options = require("utils").options
local nmap = require("utils").nmap
local map = vim.keymap.set

map("n", "<leader>n", ":set hlsearch!<CR>", { desc = "Toggle search highlight" })
map("n", "<leader>e", ":e <C-R>=expand('%:.:h') . '/'<CR>", { desc = "edit other file in same dir as current" })
map("n", "<leader>gf", ":e <cfile><cr>", { desc = "Create file under cursor and edit" })
map("n", "<leader>ff=", "mzgg=G`z", { desc = "auto-indent entire file" })
map("n", "<leader>qq", ":qa!<CR>", { desc = "Quit nvim without save" })

nmap("gF", "<C-w>vgf", "Open file under cursor in vertical split")

-- Open next/previous file in quickfix list
nmap("<Up>", ":cprevious<CR>", "Previous quickfix item")
nmap("<Down>", ":cnext<CR>", "Next quickfix item")
nmap("<Left>", ":cpfile<CR>", "Previous file in quickfix list")
nmap("<Right>", ":cnfile<CR>", "Next file in quickfix list")

-- Open in other editor
nmap("<leader>foc", ":!code % &disown<CR>", "Open the current file in VSCode")
nmap("<leader>foe", ":!emacsclient --no-wait -c %<CR>", "Open the current file in Emacs")
nmap("<leader>fot", ":!typora % &disown<CR>", "Open the current file in Typora")

-- window management
nmap("<C-w><C-t>", ":tab split<CR>", "Open current window in a new tab")
nmap("<C-w>t", ":tab split<CR>", "Open current window in a new tab")
nmap("<C-w>z", ":wincmd_<CR>:wincmd|<CR>", "Zoom current pane")
nmap("<C-w>N", ":vnew<CR>", "Create a new vertical split")

-- close buffer without closing pane
nmap("<leader>bd", ":bp | bd #<CR>", "Close buffer without closing pane")

map("x", ".", ":normal .<CR>", options("Apply last edit to selected lines"))

-- Utility function for getting the selected range in visual mode
local get_visual_selection = function()
  -- Get the starting and ending positions of the selection
  local _, start_line, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_line, end_col, _ = unpack(vim.fn.getpos("'>"))

  -- Adjust columns for inclusive selection in Lua's string indexing
  if start_line == end_line and start_col > end_col then
    start_col, end_col = end_col, start_col
  end

  return start_line, start_col, end_line, end_col
end

map("n", "<leader>fcp", function()
  -- Copy file path to clipboard
  vim.cmd('let @+ = expand("%:p")')
  -- Show notification with the file name
  vim.notify(vim.fn.expand("%:p"), vim.log.levels.INFO, { title = "Copied file path to clipboard" })
end, { desc = "Copy file path to clipboard" })

-- Format JSON
map("n", "<leader>ffj", function()
  vim.cmd("silent! %!jq '.'")
  vim.bo.filetype = "json"
  vim.notify("Formatted JSON (pretty print)")
end, { desc = "Format JSON (pretty print)" })

map("n", "<leader>ffJ", function()
  vim.cmd("silent! %!jq '.' -c")
  vim.bo.filetype = "json"
  vim.notify("Formatted JSON (compact)")
end, { desc = "Format JSON (compact)" })

-- Format XML
map("n", "<leader>ffx", function()
  vim.cmd("silent! %!xmllint --format -")
  vim.notify("Formatted XML")
end, { desc = "Format XML" })

-- Use silicon for generating images of code
map("n", "<leader>fci", function()
  vim.cmd("silent! !silicon %")
  vim.notify("Generated code image (current file)")
end, { desc = "Generate code image (current file)" })

-- Generate a code image from a visual selection
vim.keymap.set("v", "<leader>fci", function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the silicon command for the selected range
  vim.cmd(string.format("silent! %d,%dwrite !silicon -l %s", start_line, end_line, vim.bo.filetype))
  vim.notify("Generated code image (selected)")
end, { desc = "Generate code image (selected)" })

-- Copy file content or selection to clipboard using xclip
map("n", "<leader>fcc", function()
  vim.cmd("silent! !xclip -selection clipboard %")
  vim.notify("Copied file content to clipboard")
end, { desc = "Copy file content to clipboard" })

-- Copy selection to clipboard using xclip
vim.keymap.set("v", "<leader>fcc", function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the xclip command for the selected range
  vim.cmd(string.format("silent! %d,%dw !xclip -selection clipboard", start_line, end_line))
  vim.notify("Copied selection to clipboard")
end, { desc = "Copy selection to clipboard" })

-- Copy file to ~/Downloads/code
map("n", "<leader>fcd", function()
  vim.cmd("silent! !cp % ~/Downloads/code")
  vim.notify("Copied file to ~/Downloads/code")
end, { desc = "Copy file to ~/Downloads/code" })

-- https://www.youtube.com/watch?v=ooTcnx066Do
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd.startinsert()
  end,
})
map("n", "<leader>t", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end, { desc = "Toggle terminal" })

map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })


-- set filtype to javascript
map("n", "<leader>ftj", function()
  vim.bo.filetype = "javascript"
end, { desc = "javascript" })
map("n", "<leader>ftm", function()
  vim.bo.filetype = "markdown"
end, { desc = "markdown" })
map("n", "<leader>ftt", function()
  vim.bo.filetype = "text"
end, { desc = "text" })
