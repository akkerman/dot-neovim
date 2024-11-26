local options = require("utils").options
local map = vim.keymap.set
map('n', '<leader>n', ':set hlsearch!<CR>', { desc = 'Toggle search highlight' })
map('n', '<leader>e', ":e <C-R>=expand('%:.:h') . '/'<CR>", { desc = 'edit other file in same dir as current' })
map('n', '<leader>gf', ':e <cfile><cr>', { desc = 'Create file under cursor and edit' })
map('n', '<leader>F=', 'mzgg=G`z', { desc = 'auto-indent entire file' })
map('n', 'gF', '<C-w>vgf', options('Open file under cursor in vertical split'))

-- Open next/previous file in quickfix list
map('n', '<Up>', ':cprevious<CR>', options('Previous quickfix item' ))
map('n', '<Down>', ':cnext<CR>', options('Next quickfix item'))
map('n', '<Left>', ':cpfile<CR>', options('Previous file in quickfix list'))
map('n', '<Right>', ':cnfile<CR>',options('Next file in quickfix list'))

-- Open in other editor
map('n', '<leader>foc', ':!code % &disown<CR>', options('Open the current file in VSCode'))
map('n', '<leader>foe', ':!emacsclient --no-wait -c %<CR>', options('Open the current file in Emacs'))
map('n', '<leader>fot', ':!typora % &disown<CR>', options('Open the current file in Typora'))

-- window management
map('n', '<C-w><C-t>', ':tab split<CR>', options('Open current window in a new tab'))
map('n', '<C-w>t', ':tab split<CR>', options('Open current window in a new tab'))
map('n', '<C-w>z', ':wincmd_<CR>:wincmd|<CR>', options('Zoom current pane'))
map('n', '<C-w>N', ':vnew<CR>', options('Create a new vertical split'))

map('x', '.', ':normal .<CR>', options('Apply last edit to selected lines'))

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

map('n', '<leader>fcp', function()
  -- Copy file path to clipboard
  vim.cmd('let @+ = expand("%:p")')
  -- Show notification with the file name
  vim.notify(vim.fn.expand('%:p'), vim.log.levels.INFO, { title = 'Copied file path to clipboard' })
end, { desc = 'Copy file path to clipboard' })

-- Format JSON
map('n', '<leader>ffj', function()
  vim.cmd('silent! %!jq \'.\'')
  vim.bo.filetype = 'json'
  vim.notify('Formatted JSON (pretty print)')
end, { desc = 'Format JSON (pretty print)' })

map('n', '<leader>ffJ', function()
  vim.cmd('silent! %!jq \'.\' -c')
  vim.bo.filetype = 'json'
  vim.notify('Formatted JSON (compact)')
end, { desc = 'Format JSON (compact)' })

-- Format XML
map('n', '<leader>ffx', function()
  vim.cmd('silent! %!xmllint --format -')
  vim.notify('Formatted XML')
end, { desc = 'Format XML' })

-- Use silicon for generating images of code
map('n', '<leader>fci', function()
  vim.cmd('silent! !silicon %')
  vim.notify('Generated code image (current file)')
end, { desc = 'Generate code image (current file)' })

-- Generate a code image from a visual selection
vim.keymap.set('v', '<leader>fci', function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the silicon command for the selected range
  vim.cmd(string.format("silent! %d,%dwrite !silicon -l %s", start_line, end_line, vim.bo.filetype))
  vim.notify('Generated code image (selected)')
end, { desc = 'Generate code image (selected)' })

-- Copy file content or selection to clipboard using xclip
map('n', '<leader>fcc', function()
  vim.cmd('silent! !xclip -selection clipboard %')
  vim.notify('Copied file content to clipboard')
end, { desc = 'Copy file content to clipboard' })

-- Copy selection to clipboard using xclip
vim.keymap.set('v', '<leader>fcc', function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the xclip command for the selected range
  vim.cmd(string.format("silent! %d,%dw !xclip -selection clipboard", start_line, end_line))
  vim.notify('Copied selection to clipboard')
end, { desc = 'Copy selection to clipboard' })

-- Copy file to ~/Downloads/code
map('n', '<leader>fcd', function()
  vim.cmd('silent! !cp % ~/Downloads/code')
  vim.notify('Copied file to ~/Downloads/code')
end, { desc = 'Copy file to ~/Downloads/code' })

