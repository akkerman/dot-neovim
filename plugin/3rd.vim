" 
" file: plugin/3rd.vim
" vim: set fdm=marker fcs=fold\:\ :

" tpope/vim-fugitive {{{1
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gw :Git write<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>av :AV<CR>

" tpope/vim-markdown {{{1
" This plugin actually ships with vim... no need to install
" java and groovy result in loss of spelling feature
let g:markdown_fenced_languages = ["yaml","sh", "javascript", "html", "xml", "json", "vim", "python"]
let g:markdown_folding = 1

" tpope/vim-projectionist {{{1
nnoremap <c-W>a :AV<CR>
nnoremap <c-W><c-a> :AV<CR>

" iamcco/markdown-preview.nvim {{{1
" let g:mkdp_browser = 'surf'
" let g:mkdp_auto_start = 1

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

" nvim-telescope/telescope.nvim {{{1
" Find files using Telescope command-line sugar.
nnoremap <leader>\ <cmd>Telescope find_files<cr>
nnoremap <leader>l <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" mhinz/vim-startify {{{1

let g:startify_custom_header = []    " disable header
let g:startify_session_autoload = 1  " autoload Session.vim in current dir
let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['Sessions']       },
        \ { 'type': 'files',     'header': ['MRU']            },
        \ ]
" jpalardy/vim-slime {{{1
" Send code from vim to a tmux pane running a repl
let g:slime_target = "tmux"
