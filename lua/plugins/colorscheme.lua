local colors = require("config.colors").colorscheme
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if colors == "gruvbox" then
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
      end
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if colors == "nordic" then
        vim.o.background = "dark"
        require("nordic").load()
      end
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      if colors == "gruvbox-material" then
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox-material]])
      end
    end,
  },
  { "ThorstenRhau/token" },
  {
    "kungfusheep/mfd.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if colors == "mfd-stealth" then
        vim.cmd('colorscheme mfd-stealth')

        vim.opt.guicursor = {
          "n:block-CursorNormal",
          "v:block-CursorVisual",
          "i:block-CursorInsert",
          "r-cr:block-CursorReplace",
          "c:block-CursorCommand",
        }

        require('mfd').enable_cursor_sync()
      end
    end,
  }
}
