return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP integratie met autocomplete
      "hrsh7th/nvim-cmp",     -- Autocompletion
      "L3MON4D3/LuaSnip",     -- Snippets
      "saadparwaiz1/cmp_luasnip" -- Snippet integratie
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Voeg capabilities voor autocompletion toe
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configureer TypeScript (ts_ls)
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        end
      }

      -- Configureer Python (pyright)
      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        end,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict", -- Optioneel: voeg striktere typecontrole toe
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }

      -- Configureer Terraform (terraformls)
      lspconfig.terraformls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        end,
      }
    end
  },

 -- nvim-treesitter voor syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",  -- Zorg ervoor dat de parser up-to-date is
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "javascript", "typescript", "json", "jsdoc", "python", "terraform" },  -- Voeg talen toe die je nodig hebt
        highlight = {
          enable = true,  -- Zet syntax highlighting aan
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      }
    end
  },

  -- Snippet
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Laad VSCode-snippets
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
    end
  },
}
