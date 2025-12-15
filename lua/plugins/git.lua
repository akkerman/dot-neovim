local map = vim.keymap.set
return {
  -- Git integration
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
      map("n", "<leader>gg", ":Git<CR>", { desc = "Git status" })
      map("n", "<leader>gF", ":Git fetch<CR>", { desc = "Git fetch" })
      map("n", "<leader>gbb", ":Git blame<CR>", { desc = "Git blame" })
      map("n", "<leader>gS", ":Gwrite<CR>", { desc = "Git stage this file" })
      map("n", "<leader>gR", ":Gread<CR>", { desc = "Git revert file" })
      map("n", "<leader>gN", ":Git now<CR>", { desc = "Git commit all with timestamp" })
      map("n", "<leader>gL", ":Git log -- %<CR>", { desc = "Git log of this file" })
      map("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git diff" })
      map("n", "<leader>gD", ":Gvdiffsplit develop<CR>", { desc = "Git diff with develop branch" })
    end,
  },

  -- interactive Git UI
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy", -- Only load when necessary
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Lazygit mappings
      vim.api.nvim_set_keymap("n", "<Leader>gl", ":LazyGit<CR>", { noremap = true, silent = true })

      -- You can also customize the lazygit command or key bindings as per your needs
      -- For example, if you want lazygit to open a split window:
      -- vim.cmd([[ let g:lazygit_use_neovim_popup = 1 ]])
    end,
  },

  -- Git signs in the sign column
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup()

      -- Git Signs Toggles
      map("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", { desc = "Toggle Git signs" })

      -- Hunk Commands
      map("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
      map("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git hunk" })
      map("n", "<leader>ghn", ":Gitsigns next_hunk<CR>", { desc = "Next Git hunk" })
      map("n", "<leader>ghP", ":Gitsigns prev_hunk<CR>", { desc = "Previous Git hunk" })
      map("n", "]g", ":Gitsigns next_hunk<CR>", { desc = "Next Git hunk" })
      map("n", "[g", ":Gitsigns prev_hunk<CR>", { desc = "Previous Git hunk" })

      -- Blame Command
      map("n", "<leader>gbl", ":Gitsigns blame_line<CR>", { desc = "Blame Git line" })
      map("n", "<leader>gbt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "toggle blame Git current line" })
    end,
  },
}
