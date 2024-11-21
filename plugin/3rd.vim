" 
" file: plugin/3rd.vim
" vim: set fdm=marker fcs=fold\:\ :


" iamcco/markdown-preview.nvim {{{1
let g:mkdp_browser = 'google-chrome-stable'
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

" jpalardy/vim-slime {{{1
" Send code from vim to a tmux pane running a repl
let g:slime_target = "tmux"
" vim-test/vim-test {{{1
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
" let g:test#strategy = 'neomake'
" call neomake#configure#automake('nrwi', 500)

" APZelos/blamer.vim {{{1
nnoremap <leader>b <cmd>BlamerToggle<cr>
