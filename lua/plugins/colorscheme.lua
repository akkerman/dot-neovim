local colors = require('config.colors').colorscheme
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
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			if colors == "nordic" then
				vim.o.background = "dark"
				require('nordic').load()
			end
		end
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
	}
}
