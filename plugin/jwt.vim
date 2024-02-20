function! s:Jwt(token)
   execute 'new'
   setlocal buftype=nofile
   setlocal bufhidden=hide
   setlocal noswapfile
   execute "r !jwt " . a:token
   execute ":set ft=json wrap"
endfunction

command! -nargs=1 Jwt call s:Jwt("<args>")

