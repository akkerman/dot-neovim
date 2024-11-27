return { 
  {
    'gcmt/taboo.vim',
    config = function()
      vim.opt.sessionoptions:append('globals,tabpages')
      vim.g.taboo_tab_format = ' %m%U%F'
      vim.g.taboo_renamed_tab_format = ' %m%U%l'
      vim.g.taboo_modified_tab_flag = '●'
    end
  }
}
