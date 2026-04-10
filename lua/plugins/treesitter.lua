return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd("TSUpdate")
      -- Apply local patch for Neovim 0.12 compatibility (nvim-treesitter/nvim-treesitter#8636)
      local plugin_dir = require("lazy.core.config").options.root .. "/nvim-treesitter"
      local patch = vim.fn.stdpath("config") .. "/patches/nvim-treesitter-neovim-0.12.patch"
      vim.fn.system({ "git", "-C", plugin_dir, "apply", "--ignore-whitespace", patch })
    end,
    config = function()
      -- nvim-treesitter used for parser management only.
      -- Highlighting is handled by Neovim's native treesitter (see autocmd below).
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
        highlight = { enable = false },
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
