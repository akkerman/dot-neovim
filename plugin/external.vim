" file: plugin/external.vim

" format json
nnoremap <leader>jj :%!jq '.'<cr>:set ft=json<cr>
nnoremap <leader>jJ :%!jq '.' -c<cr>:set ft=json<cr>
" format xml
nnoremap <leader>x :%!xmllint --format -<cr>

nnoremap <leader>p :!silicon %<cr>
vnoremap <leader>p :w !silicon -l %:e<cr>

nnoremap <leader>c :!xclip -selection clipboard %<cr>
vnoremap <leader>c :w !xclip -selection clipboard<cr>
