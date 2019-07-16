" file: plugin/external.vim

" format json
nnoremap <leader>j :%!jq '.'<cr>:set ft=json<cr>
" format xml
nnoremap <leader>x :%!xmllint --format -<cr>

