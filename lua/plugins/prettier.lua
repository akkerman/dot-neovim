return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- npm install -g @fsouza/prettierd
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "custom_stylua" },
      },
      formatters = {
        custom_stylua = {
          command = "stylua", -- paru -S stylua
          args = { "--indent-type", "Spaces", "--indent-width", "2", "$FILENAME" },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },
    },
  },
}
