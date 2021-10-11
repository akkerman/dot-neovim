"
" vim: set fdc=1 fdm=marker fcs=fold\:\ :
"
" plug {{{1
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'    " gc adds comments
Plug 'tpope/vim-repeat'        " enable repeat for supported plugins
Plug 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'       " Case insensitive substitute
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-cucumber'

" GIT
Plug 'tpope/vim-fugitive'            " for git commands and branch in statusbar
Plug 'tpope/vim-rhubarb'             " enable :GBrowse for github
Plug 'shumphrey/fugitive-gitlab.vim' " enable :GBrowse for gitlab
Plug 'airblade/vim-gitgutter'

Plug 'wellle/targets.vim'       " additional text objects 

Plug 'cespare/vim-toml'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" markdown
" Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ellisonleao/glow.nvim'

" file explorer
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" colors
Plug 'gruvbox-community/gruvbox'
Plug 'akkerman/vim-jasmine'

" opening and finding files with fzf {{{2
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" }}}2

" opening and finding files with telescope {{{2
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
" }}}2


" lsp, completion, snippets {{{1
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'glepnir/lspsaga.nvim'
"1]}}

Plug 'chr4/nginx.vim'

Plug 'godlygeek/tabular'
Plug 'gcmt/taboo.vim'

" javascript {{{2
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'akkerman/vim-jasmine-fold'
Plug 'jpalardy/vim-slime'
" }}}2

Plug 'vim-test/vim-test'
Plug 'neomake/neomake'

Plug 'mhinz/vim-startify'

" Plug 'jceb/vim-orgmode'
" Plug 'kristijanhusak/orgmode.nvim'
call plug#end()
" plug }}}1
" colors {{{1
if has('termguicolors')
    set termguicolors
    let g:gruvbox_italic=1
    " let g:gruvbox_contrast_dark='soft'
    " let g:gruvbox_contrast_dark='medium' " default
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_hls_highlight='orange'
    let g:gruvbox_invert_selection='0'

    let &t_8f= "\<Esc>[38;2;%lu;$lu;$lum"
    let &t_8b= "\<Esc>[48;2;%lu;$lu;$lum"
endif
set background=dark
color gruvbox
" colors }}}1
" ack {{{1
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ "$*"
  set grepformat=%f:%l:%c:%m
  " cnoreabbrev ack grep
  cnoreabbrev grepjs grep --js --notestjs
  cnoreabbrev ackjs ack --js --notestjs
  command! -bang -nargs=* Ack
  \ call fzf#vim#grep(
  \   'ack --nogroup --column --color '.<q-args>, 1,
  \   fzf#vim#with_preview(), <bang>0)

  nnoremap <silent> <space>st *<bar>:set hlsearch<bar>:grep --js <c-r><c-w><bar>:copen<cr>
  nnoremap <silent> <space>sj *<bar>:set hlsearch<bar>:grep --js --notestjs <c-r><c-w><bar>:copen<cr>
endif
" ack }}}1

set statusline=%<%f\ %h%m%r%{ObsessionStatus()}%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

set listchars=tab:»·,trail:·

nnoremap <leader>n :set hlsearch!<cr>


" Open files located in the same dir as the current file
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
nnoremap <leader>r :r <C-R>=expand("%:.:h") . "/"<CR>

" make current file executable
nnoremap <leader>fx :!chmod +x %<CR>


set sessionoptions+=tabpages,globals

set mouse=n
set nowrap

" swapfiles and undo
set directory=~/.cache/nvim/swap//
set undodir=~/.cache/nvim/undo//
set undofile

let &colorcolumn="80,".join(range(120,999),",")

set cursorline

set ignorecase " ignore the case of words when searching
set smartcase  " only ignore case when the search is lowercase

" if has('autocmd')
"     augroup AutoResize
"         autocmd!
"         autocmd VimResized * execute "normal! \<c-w>="
"     augroup END
" endif

" 'copy' window to tabpage instead of moving
nnoremap <leader>wt :$tab split<CR>
nnoremap <c-w><c-t> :tab split<CR>
nnoremap <c-w>t :tab split<CR>

" open file in vscode
nnoremap <leader>vc :!code %&disown<CR>

" open next/previous (file) in quickfix list
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" stable/center cursor
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


let g:netrw_banner=0
let g:netrw_liststyle=3 "Tree style

if has('linebreak')
    set linebreak " only wrap certain characters (not in the middle of a word
    set breakindent
    let &showbreak='↳ '
    if exists('&breakindentopt')
        set breakindentopt=shift:2
    endif
endif

set scrolloff=3
set spellcapcheck=  " when adding a word with all lowercase to custom dict, the same word with first capitalized is also added

if has('virtualedit')
    set virtualedit=block " in visual block mode, allow cursor to move where there is not text
endif

let g:netrw_browsex_viewer='/usr/bin/xdg-open'
nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR>

" augroup jest
"     autocmd BufReadPost,BufNewFile *.test.js set filetype=javascript.jest
" augroup END

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy' ]


nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> <C-p> <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-u> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent>gn <cmd>lua require('lspsaga.rename').rename()<CR>

let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)


" code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

lua << EOF
local lspcfg = require('lspconfig')
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Completion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})

-- javascript and typescript server

lspcfg.tsserver.setup { 
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
  end
}

-- eslint in efm language server

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

lspcfg.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false


     if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
         augroup END
         ]], true)
     end
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}
EOF
