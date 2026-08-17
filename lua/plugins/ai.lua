return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = "<C-l>",
          dismiss = "<C-c>",
        },
      },
      panel = { enabled = false },
    },
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
      { "<leader>Ac", ":CodeCompanionChat Toggle<CR>", mode = { "n", "v" }, desc = "Toggle AI chat" },
      { "<leader>Aa", ":CodeCompanionChat Add<CR>", mode = "v", desc = "Add selectie aan chat" },
      { "<leader>Ai", ":CodeCompanion<CR>", mode = { "n", "v" }, desc = "AI inline" },
    },
  },
}
