return {
  {
    -- for syntax highlighting and more
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' }, 
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

        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Zorgt ervoor dat het vooruit kijkt voor betere matches
            keymaps = {
              -- Select textobjects
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- Voeg jumps toe aan jumplist
            goto_next_start = {
            },
            goto_next_end = {
            },
            goto_previous_start = {
            },
            goto_previous_end = {
            },
          },
        },
      }
    end
  },
}
