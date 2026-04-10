return {
  {
    -- for syntax highlighting and more
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = function()
      vim.cmd("TSUpdate")
      -- Apply local patch for Neovim 0.12 compatibility (nvim-treesitter/nvim-treesitter#8636)
      local plugin_dir = require("lazy.core.config").options.root .. "/nvim-treesitter"
      local patch = vim.fn.stdpath("config") .. "/patches/nvim-treesitter-neovim-0.12.patch"
      vim.fn.system({ "git", "-C", plugin_dir, "apply", "--ignore-whitespace", patch })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "python",
          "query",
          "terraform",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "mermaid",
        },

        auto_install = true,
        sync_install = false,
        ignore_install = {},
        modules = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Zorgt ervoor dat het vooruit kijkt voor betere matches
            keymaps = {
              -- Select textobjects
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- Voeg jumps toe aan jumplist
            goto_next_start = {},
            goto_next_end = {},
            goto_previous_start = {},
            goto_previous_end = {},
          },
        },
      })
    end,
  },
}
