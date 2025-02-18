return {
  {
    'tpope/vim-projectionist',
    config = function()
      local map = vim.keymap.set

      map("n", "<c-W>a", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
      map("n", "<leader>fa", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
      map("n", "<c-W><c-a>", ":AV<CR>", { desc = "Open alternate file vertically to the left" })
      map("n", "<c-W>A", ":bo :AV<CR>", { desc = "Open alternate file vertically to the right" })
      map("n", "<leader>fA", ":bo :AV<CR>", { desc = "Open alternate file vertically to the right" })
      map("n", "<c-W>i", ":sp %:p:h/index.js<CR>", { desc = "Open index.js in a new split" })
      map("n", "<leader>fi", ":sp %:p:h/index.js<CR>", { desc = "Open index.js in a new split" })
    end
  },
}
