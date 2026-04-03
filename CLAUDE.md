# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. The config is written entirely in Lua.

## Architecture

**Entry point:** `init.lua` loads three modules in order: `config.lazy` (plugin manager bootstrap), `config.options` (vim settings), `config.keymaps` (global keybindings).

**Directory layout:**
- `lua/config/` — core config: `lazy.lua` (plugin setup), `options.lua`, `keymaps.lua`, `colors.lua`
- `lua/plugins/` — one file per plugin or plugin group, each returns a lazy.nvim plugin spec table
- `lua/snippets/` — LuaSnip snippet definitions per filetype
- `lua/utils.lua` — shared helpers (`nmap`, `options`, `get_git_root_or_cwd`, `get_git_branch_name`)
- `plugin/` — standalone Lua scripts auto-sourced by Neovim (not lazy-loaded); these implement custom features like session management, quickfix helpers, scratch buffers, JWT decoding, etc.
- `after/ftplugin/` — filetype-specific settings

**Plugin conventions:** Every file in `lua/plugins/` is auto-imported via `{ import = "plugins" }` in `lazy.lua`. Each file must return a valid lazy.nvim spec (a table or list of tables).

**Keybindings:** `<Space>` is `<leader>`, `\` is `<localleader>`. All keybindings include a `desc` field. Global mappings live in `lua/config/keymaps.lua`; plugin-specific mappings are defined inside each plugin's `config` function. The `utils.nmap` helper wraps `vim.keymap.set("n", ...)` with `noremap`+`silent` defaults.

**Session system** (`plugin/session-light.lua`): Custom lightweight session management built on top of Vim's `:mksession`. Sessions are stored as `Session-<name>.vim` files at the git root. Branch-aware: auto-names sessions after the current git branch. Key commands: `:SessionCreate`, `:SessionLoad`, `:SessionSearch`.

## LSP Servers

Configured in `lua/plugins/lsp.lua` using `vim.lsp.config()` (Neovim 0.11+):
- `ts_ls` — TypeScript/JavaScript
- `eslint` — ESLint (install: `paru -S vscode-langservers-extracted`)
- `pyright` — Python (strict mode)
- `terraformls` — Terraform
- `yamlls` — YAML with schema validation (install: `npm install -g yaml-language-server`)
- `lua_ls` — Lua (install: `paru -S lua-language-server`)
- `hls` — Haskell (install via `ghcup`)

## Testing

Tests run via neotest with neotest-jest adapter. Configuration assumes Jest with `jest.config.js` at the project root, using `npm test --` as the Jest command.

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec. It will be auto-discovered. Define keymaps inside the plugin's `config` function, always with a `desc`.
