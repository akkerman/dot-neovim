return {
  -- for syntax highlighting and more
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',  -- Zorg ervoor dat de parser up-to-date is
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'python',
        'query',
        'terraform',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },


      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,  -- Zet syntax highlighting aan
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
