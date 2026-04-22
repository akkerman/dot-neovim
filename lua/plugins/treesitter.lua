return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- nvim-treesitter v2: parser management only.
      -- Highlighting handled by Neovim's native treesitter (see autocmd below).
      require("nvim-treesitter.config").setup()

      require("nvim-treesitter").install({
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
      })

      local group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
