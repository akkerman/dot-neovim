return {
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

      -- Configureer YAML (yamlls)
      -- npm install -g yaml-language-server
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemas = {
              -- zie https://schemastore.org/json/
              ["https://spec.openapis.org/oas/3.1/schema/2022-10-07"] = { "*openapi.yaml", "*openapi.yml" },
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = { "docker-compose*.yaml", "docker-compose*.yml" },
              ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml",
              ["https://json.schemastore.org/traefik-v3.json"] = { "*.traefik*.yaml", "*.traefik*.yml" },
            },
            validate = true,
            format = true,
            hover = true,
            completion = true,
          },
        },
      }

      -- Configureer Lua (lua_ls)
      -- paru -S lua-language-server
      lspconfig.lua_ls.setup {
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
      }

    end -- end of lsp config
  }
}