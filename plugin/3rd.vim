" 
" file: plugin/3rd.vim
" vim: set fdm=marker fcs=fold\:\ :

" tpope/vim-fugitive {{{1
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>

" tpope/vim-markdown {{{1
"
" java and groovy result in loss of spelling feature
let g:markdown_fenced_languages = ["yaml","sh", "javascript", "html", "xml", "json", "vim", "python"]

" iamcco/markdown-preview.nvim {{{1
" let g:mkdp_browser = 'surftab'
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
