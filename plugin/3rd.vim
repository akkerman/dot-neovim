" 
" file: plugin/3rd.vim
" vim: set fdm=marker fcs=fold\:\ :

" tpope/vim-fugitive {{{1
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Git write<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" tpope/vim-markdown {{{1
" This plugin actually ships with vim... no need to install
" java and groovy result in loss of spelling feature
let g:markdown_fenced_languages = ["yaml","sh", "javascript", "html", "xml", "json", "vim", "python", "mermaid", "plantuml"]
let g:markdown_folding = 1

" tpope/vim-projectionist {{{1
nnoremap <c-W>a :AV<CR>
nnoremap <c-W><c-a> :AV<CR>

nnoremap <c-W>A :bo :AV<CR>
nnoremap <c-W>i :sp %:p:h/index.js<CR>

" nnoremap <silent> <leader>av :AV<CR>

" iamcco/markdown-preview.nvim {{{1
let g:mkdp_browser = 'qutebrowser'
" let g:mkdp_auto_start = 1
nnoremap <space>mt :MarkdownPreviewToggle<cr>

" honza/vim-snippets {{{1
" javascript 
let g:ultisnips_javascript = {
     \ 'keyword-spacing': 'always',
     \ 'semi': 'never',
     \ 'space-before-function-paren': 'never',
     \ }


" gcmt/taboo.vim {{{1
nnoremap <leader>tr :TabooRename 

" junegunn/fzf.vim {{{1
" nmap <leader>\ :Files<cr>
" nmap <leader>l :Buffers<cr>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" stsewd/fzf-checkout.vim {{{1
nnoremap <leader>gc :GBranches<CR>

" nvim-telescope/telescope.nvim {{{1
" Find files using Telescope command-line sugar.
nnoremap <leader>\ <cmd>Telescope find_files<cr>
nnoremap <leader>l <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" just in case I hit the emacs roam binding
nnoremap <space>nrf <cmd>Telescope find_files<cr>
nnoremap <space>. <cmd>Telescope find_files<cr>
nnoremap <space><space> <cmd>Telescope find_files<cr>
nnoremap <space>pt <cmd>grep --js 'TODO\\|it\\.todo\\|test\\.todo'<cr><cmd>Telescope quickfix<cr>
nnoremap <space>ps <cmd>grep --js 'it\\.skip\\|test\\.skip\\|describe\\.skip\\| xit\(\\|it\\.only\\|test\\.only'<cr><cmd>Telescope quickfix<cr>

" mhinz/vim-startify {{{1
"  let g:startify_custom_header = ['Startify']    " disable header
"  let g:startify_session_autoload = 1  " autoload Session.vim in current dir
"  let g:startify_bookmarks = [ 
"          \ '~/git/dsplatform/capo-frontend', 
"          \ '~/git/dsplatform/analytics-wiki',
"          \ '~/git/dsplatform/dsp-analytics-frontend',
"          \ '~/git/dsplatform/dsp-analytics-services',
"          \ ]
"  let g:startify_lists = [
"          \ { 'type': 'sessions',  'header': ['Sessions']       },
"          \ { 'type': 'bookmarks', 'header': ['Bookmarks']      },
"          \ { 'type': 'files',     'header': ['MRU']            },
"          \ ]
" jpalardy/vim-slime {{{1
" Send code from vim to a tmux pane running a repl
let g:slime_target = "tmux"
" vim-test/vim-test {{{1
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:test#strategy = 'neomake'
call neomake#configure#automake('nrwi', 500)

" nvim-orgmode/orgmode {{{1
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/Dropbox/Apps/Orgzly/*' },
  org_default_notes_file = '~/org/notes.org',
})
EOF
" APZelos/blamer.vim {{{1
nnoremap <leader>b <cmd>BlamerToggle<cr>
