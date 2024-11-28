return {
  {
    'gcmt/taboo.vim',
    config = function()
      vim.opt.sessionoptions:append('globals,tabpages')
      vim.g.taboo_tab_format = ' %m%U%F'
      vim.g.taboo_renamed_tab_format = ' %m%U%l'
      vim.g.taboo_modified_tab_flag = '●'
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          -- theme = 'gruvbox',
          globalstatus = true,
        },
        sections = { lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1,1) end } },
        },
      }
    end
  }
}
