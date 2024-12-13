return {
  {
    "christoomey/vim-tmux-runner",
    lazy = false,
    config = function ()
      vim.api.nvim_set_keymap('v', '<leader>rr', ':VtrSendLinesToRunner<CR>', { noremap = true, silent = true, desc = "Send selected lines to tmux runner" })
      vim.api.nvim_set_keymap('n', '<leader>rr', ':VtrSendLinesToRunner<CR>', { noremap = true, silent = true, desc = "Send selected lines to tmux runner" })
      vim.api.nvim_set_keymap('n', '<leader>rs', ':VtrSendCommandToRunner<CR>', { noremap = true, silent = true, desc = "Send a command to tmux runner" })
      vim.api.nvim_set_keymap('n', '<leader>rl', ':VtrOpenRunner<CR>', { noremap = true, silent = true, desc = "Open a tmux runner pane" })
    end
  },
  {
    'jpalardy/vim-slime',
    lazy = false,
    config = function ()
      vim.g.slime_target = "tmux"
    end

  }
}
