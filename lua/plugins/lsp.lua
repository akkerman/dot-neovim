return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP integratie met autocomplete
      "hrsh7th/nvim-cmp",         -- Autocompletion
      "L3MON4D3/LuaSnip",         -- Snippets
      "saadparwaiz1/cmp_luasnip", -- Snippet integratie
      "stevearc/dressing.nvim",   -- popup
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Voeg capabilities voor autocompletion toe
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- on_attach functie om keymaps te zetten als de server aanhaakt aan een buffer
      local function on_attach(client, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
        end
        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover information")
        bufmap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol")
        bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action")
      end

      vim.diagnostic.config({
        virtual_text = true,
      })

      -- Configureer TypeScript (ts_ls)
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Configure ESLint Language Server (vscode-eslint)
      -- paru -S vscode-langservers-extracted
      -- vim.lsp.config("eslint", {
      --   on_attach = function(client, bufnr)
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       buffer = bufnr,
      --       command = "EslintFixAll",
      --     })
      --   end,
      -- })

      -- Configureer Python (pyright)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "strict", -- Optioneel: voeg striktere typecontrole toe
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- Configureer Terraform (terraformls)
      vim.lsp.config("terraformls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Configureer YAML (yamlls)
      -- npm install -g yaml-language-server
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemas = {
              -- zie https://schemastore.org/json/
              ["https://spec.openapis.org/oas/3.1/schema/2022-10-07"] = { "*openapi.yaml", "*openapi.yml" },
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                "docker-compose*.yaml",
                "docker-compose*.yml",
              },
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
              ".gitlab-ci.yml",
              ["https://json.schemastore.org/traefik-v3.json"] = { "*.traefik*.yaml", "*.traefik*.yml" },
            },
            validate = true,
            format = true,
            hover = true,
            completion = true,
          },
        },
      })

      -- Configureer Lua (lua_ls)
      -- paru -S lua-language-server
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              -- LuaJIT in Neovim gebruiken
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              -- Herken 'vim' als een globale variabele
              globals = { "vim" },
            },
            workspace = {
              -- Zorg dat de server Neovim runtime-bestanden herkent
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false, -- Voorkom pop-ups over third-party tooling
            },
            telemetry = {
              enable = false, -- Schakel telemetrie uit
            },
          },
        },
      })

      -- haskell
      -- ghcup install hls
      -- evt: ghcup tui
      vim.lsp.config("hls", {
        on_attach = on_attach,
      })


      -- -- golang
      -- -- go install golang.org/x/tools/gopls@latest
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "go",
      --   callback = function()
      --     vim.lsp.start(vim.lsp.config('gopls', {
      --       capabilities = capabilities,
      --       on_attach = on_attach,
      --       settings = {
      --         gopls = {
      --           analyses = {
      --             unusedparams = true,
      --             shadow = true,
      --           },
      --           staticcheck = true,
      --           gofumpt = true, -- gebruik 'gofumpt' voor striktere formattering
      --         },
      --       },
      --     }))
      --   end,
      -- })
    end, -- end of lsp config
  },
}
