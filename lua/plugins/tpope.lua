return {
  'tpope/vim-sleuth',
  {
  'tpope/vim-projectionist',
  config = function() 
    map = vim.keymap.set

    map("n", "<c-W>a", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
    map("n", "fa", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
    map("n", "<c-W><c-a>", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
    map("n", "<c-W>A", ":bo :AV<CR>", { desc = "Open alternate file vertically to the right" })
    map("n", "fA", ":bo :AV<CR>", { desc = "Open alternate file vertically to the right" })
    map("n", "<c-W>i", ":sp %:p:h/index.js<CR>", { desc = "Open index.js in a new split" })
    map("n", "fi", ":sp %:p:h/index.js<CR>", { desc = "Open index.js in a new split" })
  end
  },
  {
    'tpope/vim-fugitive',
    config = function()
      map = vim.keymap.set
      map('n', '<leader>gg', ':Git<CR>', { desc = 'Git status' })
      map('n', '<leader>gF', ':Git fetch<CR>', { desc = 'Git fetch' })
      map('n', '<leader>gB', ':Git blame<CR>', { desc = 'Git blame' })
      map('n', '<leader>gS', ':Gwrite<CR>', { desc = 'Git stage this file' })
      map('n', '<leader>gR', ':Gread<CR>', { desc = 'Git revert file' })
      map('n', '<leader>gN', ':Git now<CR>', { desc = 'Git commit all with timestamp' })
    end,
  },
}
