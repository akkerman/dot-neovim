return {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim',
    config = function ()
      builtin = require 'telescope.builtin'
      map = vim.keymap.set
      map('n', '<leader>/', builtin.live_grep, { desc = 'Find in files' })

      map('n', '<leader>.', builtin.find_files, { desc = 'Find files' })
      map('n', '<space><space>', builtin.find_files, { desc = 'Find files'})
      map('n', '<leader>ff', builtin.find_files, { desc = 'Find files'})

      map('n', '<leader>bb', builtin.buffers, { desc = 'Switch buffer'})

      map('n', '<leader>gb', builtin.git_branches, { desc = 'Git branches'})
    end
  }
}
