return { -- shows pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = "<Up> ",
        Down = "<Down> ",
        Left = "<Left> ",
        Right = "<Right> ",
        C = "<C-…> ",
        M = "<M-…> ",
        D = "<D-…> ",
        S = "<S-…> ",
        CR = "<CR> ",
        Esc = "<Esc> ",
        ScrollWheelDown = "<ScrollWheelDown> ",
        ScrollWheelUp = "<ScrollWheelUp> ",
        NL = "<NL> ",
        BS = "<BS> ",
        Space = "<Space> ",
        Tab = "<Tab> ",
        F1 = "<F1>",
        F2 = "<F2>",
        F3 = "<F3>",
        F4 = "<F4>",
        F5 = "<F5>",
        F6 = "<F6>",
        F7 = "<F7>",
        F8 = "<F8>",
        F9 = "<F9>",
        F10 = "<F10>",
        F11 = "<F11>",
        F12 = "<F12>",
      },
    },

    -- Document existing key chains
    spec = {
      { "<leader>b", group = "+buffer" },
      { "<leader>c", group = "+code" },
      { "<leader>cc", group = "+coverage" },
      { "<leader>ct", group = "+test" },
      { "<leader>f", group = "+file" },
      { "<leader>fc", group = "+copy" },
      { "<leader>fe", group = "+explore" },
      { "<leader>ff", group = "+format" },
      { "<leader>fo", group = "+open" },
      { "<leader>g", group = "+git" },
      { "<leader>gb", group = "+blame" },
      { "<leader>gh", group = "+hunk" },
      { "<leader>l", group = "+line" },
      { "<leader>r", group = "+run in tmux" },
      { "<leader>s", group = "+session" },
    },
  },
}
