local map = vim.keymap.set
map('n', '<leader>n', ':set hlsearch!<CR>', { desc = '(dis)able search highlight' })
map('n', '<leader>e', ":e <C-R>=expand('%:.:h') . '/'<CR>", { desc = 'edit other file in same dir as current' })
map('n', '<leader>gf', ':e <cfile><cr>', { desc = 'edit file or create file under cursor' })
map('n', '<leader>fc', ":let @+ = expand('%:p')<cr>", { desc = 'copy filepath to clipboard' })
map('n', '<leader>=', 'mzgg=G`z', { desc = 'auto-indent entire file' })


-- Format JSON
map('n', '<leader>Fj', ':%!jq \'.\'<cr>:set ft=json<cr>', { desc = 'Format JSON (pretty print)' })
map('n', '<leader>FJ', ':%!jq \'.\' -c<cr>:set ft=json<cr>', { desc = 'Format JSON (compact)' })

-- Format XML
map('n', '<leader>Fx', ':%!xmllint --format -<cr>', { desc = 'Format XML' })

-- Use silicon for generating images of code
map('n', '<leader>ci', ':!silicon %<cr>', { desc = 'Generate code image (current file)' })
map('v', '<leader>ci', ':w !silicon -l %:e<cr>', { desc = 'Generate code image (selected)' })

-- Copy file content or selection to clipboard using xclip
map('n', '<leader>cc', ':!xclip -selection clipboard %<cr>', { desc = 'Copy file content to clipboard' })
map('v', '<leader>cc', ':w !xclip -selection clipboard<cr>', { desc = 'Copy selection to clipboard' })

-- Copy file to ~/Downloads/code 
map('n', '<leader>cp', ':!cp % ~/Downloads/code<cr>', { desc = 'Copy file to ~/Downloads/code' })
