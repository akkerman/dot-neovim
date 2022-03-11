function! s:Jwt(token)
   execute ":new | r !jwt " . a:token
   execute ":set ft=json wrap"
endfunction

command! -nargs=1 Jwt call s:Jwt("<args>")

