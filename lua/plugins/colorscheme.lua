return { 
	"ellisonleao/gruvbox.nvim", 
	lazy = false,
	priority = 1000, 
	config = function ()
	      vim.o.background = "dark"
	      -- load the colorscheme here
	      vim.cmd([[colorscheme gruvbox]])
	end,
}

