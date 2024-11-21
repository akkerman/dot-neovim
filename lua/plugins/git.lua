return {
  -- Git integration
  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
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

  -- interactive Git UI
  {
    'kdheepak/lazygit.nvim',
    event = "VeryLazy", -- Only load when necessary
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Lazygit mappings
      vim.api.nvim_set_keymap('n', '<Leader>gl', ':LazyGit<CR>', { noremap = true, silent = true })

      -- You can also customize the lazygit command or key bindings as per your needs
      -- For example, if you want lazygit to open a split window:
      -- vim.cmd([[ let g:lazygit_use_neovim_popup = 1 ]])
    end,
  },
}
