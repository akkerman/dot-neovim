return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false }, -- via cmp
      panel = { enabled = false },      -- via cmp
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = {},
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      opts = {
        log_level = "DEBUG",
      },
    },
    keys = {
      { "<leader>aa", ":CodeCompanionChat Toggle<CR>", mode = { "n", "v" }, desc = "Toggle AI chat" },
      { "<leader>ac", ":CodeCompanionChat Add<CR>",    mode = "v",          desc = "Add selectie aan chat" },
      { "<leader>ai", ":CodeCompanion<CR>",            mode = { "n", "v" }, desc = "AI inline" },
    },
  },
}
