local map = vim.keymap.set
return {
  -- Git integration
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
      local function toggle_git_log()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == "quickfix" then
            vim.cmd("cclose")
            return
          end
        end
        vim.cmd("Gclog!")
      end

      map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
      map("n", "<leader>gg", ":Git<CR>", { desc = "Git status" })
      map("n", "<leader>gl", toggle_git_log, { desc = "Toggle git log" })
      map("n", "<leader>gF", ":Git fetch<CR>", { desc = "Git fetch" })
      map("n", "<leader>gbb", ":Git blame<CR>", { desc = "Git blame" })
      map("n", "<leader>gS", ":Gwrite<CR>", { desc = "Git stage this file" })
      map("n", "<leader>gR", ":Gread<CR>", { desc = "Git revert file" })
      map("n", "<leader>gN", ":Git now<CR>", { desc = "Git commit all with timestamp" })
      map("n", "<leader>gL", ":Git log -- %<CR>", { desc = "Git log of this file" })
      map("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git diff" })
      map("n", "<leader>gD", ":Gvdiffsplit develop<CR>", { desc = "Git diff with develop branch" })
      map("n", "<leader>gM", ":Gvdiffsplit main<CR>", { desc = "Git diff with main branch" })
      map("n", "<leader>gp", ":G pull<CR>", { desc = "Git pull" })
      map("n", "<leader>gP", ":G pull --rebase<CR>", { desc = "Git pull --rebase" })
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
