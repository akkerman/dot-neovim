local map = vim.keymap.set
map('n', '<leader>n', ':set hlsearch!<CR>', { desc = '(dis)able search highlight' })
map('n', '<leader>e', ":e <C-R>=expand('%:.:h') . '/'<CR>", { desc = 'edit other file in same dir as current' })
map('n', '<leader>gf', ':e <cfile><cr>', { desc = 'edit file or create file under cursor' })
map('n', '<leader>fc', ":let @+ = expand('%:p')<cr>", { desc = 'copy filepath to clipboard' })
map('n', '<leader>=', 'mzgg=G`z', { desc = 'auto-indent entire file' })
