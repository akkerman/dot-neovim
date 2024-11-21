return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to follow the latest version
  event = "VeryLazy", -- Load when needed
  config = function()
    require("nvim-surround").setup({
      -- Configuration options go here
    })
  end,
}
