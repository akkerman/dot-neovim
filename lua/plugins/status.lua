return {
  {
    'gcmt/taboo.vim',
    config = function()
      vim.opt.sessionoptions:append('globals,tabpages')
      vim.g.taboo_tab_format = ' %m%I%F'
      vim.g.taboo_renamed_tab_format = ' %m%I%l'
      vim.g.taboo_modified_tab_flag = ''
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_a = {{
            function()
              local sessionPath = vim.v.this_session
              if not sessionPath or sessionPath == "" then
                return " "
              end

              local filename = vim.fn.fnamemodify(sessionPath, ':t:r')

              if filename == 'Session' then
                return "default"
              end

              if not filename:find("^Session%-") then
                return filename
              end

              return filename:sub(9)
            end,
            -- Optional: Add icons or formatting if needed
            icon = '',  -- Example icon for sessions
          }},
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename' },
          lualine_x = { },
          lualine_y = { 'location' },
          lualine_z = { 'progress'},
        }
      }
    end
  }
}
