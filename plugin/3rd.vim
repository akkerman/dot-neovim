" 
" file: plugin/3rd.vim
" vim: set fdm=marker fcs=fold\:\ :

" tpope/vim-fugitive {{{1
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gw :Git write<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" tpope/vim-markdown {{{1
"
" java and groovy result in loss of spelling feature
let g:markdown_fenced_languages = ["yaml","sh", "javascript", "html", "xml", "json", "vim", "python"]

" tpope/vim-projectionist {{{1
nnoremap <c-W>a :AV<CR>
nnoremap <c-W><c-a> :AV<CR>

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
