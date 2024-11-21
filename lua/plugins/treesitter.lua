return { -- for syntax highlighting and more
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",  -- Zorg ervoor dat de parser up-to-date is
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "javascript", "typescript", "json", "jsdoc", "python", "terraform" },  -- Voeg talen toe die je nodig hebt
      highlight = {
        enable = true,  -- Zet syntax highlighting aan
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
