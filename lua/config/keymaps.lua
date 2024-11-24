local map = vim.keymap.set
map('n', '<leader>n', ':set hlsearch!<CR>', { desc = '(dis)able search highlight' })
map('n', '<leader>e', ":e <C-R>=expand('%:.:h') . '/'<CR>", { desc = 'edit other file in same dir as current' })
map('n', '<leader>gf', ':e <cfile><cr>', { desc = 'edit file or create file under cursor' })
map('n', '<leader>fc', ":let @+ = expand('%:p')<cr>", { desc = 'copy filepath to clipboard' })
map('n', '<leader>=', 'mzgg=G`z', { desc = 'auto-indent entire file' })

-- Utility function for notifications
local notify = function(msg, level)
  level = level or vim.log.levels.INFO
  vim.notify(msg, level, { title = "Action Completed" })
end

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

-- Format JSON
map('n', '<leader>Fj', function()
  vim.cmd('silent! %!jq \'.\'')
  vim.bo.filetype = 'json'
  notify('Formatted JSON (pretty print)')
end, { desc = 'Format JSON (pretty print)' })

map('n', '<leader>FJ', function()
  vim.cmd('silent! %!jq \'.\' -c')
  vim.bo.filetype = 'json'
  notify('Formatted JSON (compact)')
end, { desc = 'Format JSON (compact)' })

-- Format XML
map('n', '<leader>Fx', function()
  vim.cmd('silent! %!xmllint --format -')
  notify('Formatted XML')
end, { desc = 'Format XML' })

-- Use silicon for generating images of code
map('n', '<leader>ci', function()
  vim.cmd('silent! !silicon %')
  notify('Generated code image (current file)')
end, { desc = 'Generate code image (current file)' })

-- Generate a code image from a visual selection
vim.keymap.set('v', '<leader>ci', function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the silicon command for the selected range
  vim.cmd(string.format("silent! %d,%dwrite !silicon -l %s", start_line, end_line, vim.bo.filetype))
  notify('Generated code image (selected)')
end, { desc = 'Generate code image (selected)' })

-- Copy file content or selection to clipboard using xclip
map('n', '<leader>cc', function()
  vim.cmd('silent! !xclip -selection clipboard %')
  notify('Copied file content to clipboard')
end, { desc = 'Copy file content to clipboard' })

-- Copy selection to clipboard using xclip
vim.keymap.set('v', '<leader>cc', function()
  local start_line, _, end_line, _ = get_visual_selection()
  -- Run the xclip command for the selected range
  vim.cmd(string.format("silent! %d,%dw !xclip -selection clipboard", start_line, end_line))
  notify('Copied selection to clipboard')
end, { desc = 'Copy selection to clipboard' })

-- Copy file to ~/Downloads/code
map('n', '<leader>cp', function()
  vim.cmd('silent! !cp % ~/Downloads/code')
  notify('Copied file to ~/Downloads/code')
end, { desc = 'Copy file to ~/Downloads/code' })
