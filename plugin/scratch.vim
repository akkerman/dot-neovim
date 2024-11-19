function! s:NewScratch()
    execute 'new'
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
endfunction

command! -nargs=0 Scratch call s:NewScratch()

" open current line as json in scratch buffer
nnoremap <leader>J yy:Scratch<cr>p:%!jq '.'<cr>:set ft=json<cr>Wz
nmap <c-W>S :Scratch<cr> 
nmap <SPACE>x :Scratch<cr>
