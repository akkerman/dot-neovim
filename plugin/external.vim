" file: plugin/external.vim

" format json
nnoremap <leader>jj :%!jq '.'<cr>:set ft=json<cr>
nnoremap <leader>jJ :%!jq '.' -c<cr>:set ft=json<cr>
" format xml
nnoremap <leader>x :%!xmllint --format -<cr>

nnoremap <space>p :!silicon %<cr>
vnoremap <space>p :w !silicon -l %:e<cr>

nnoremap <space>c :!xclip -selection clipboard %<cr>
vnoremap <space>c :w !xclip -selection clipboard<cr>

