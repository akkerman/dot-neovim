function! s:Scrot()
  let suffix = strftime('_scrot-%Y%m%d%H%M%S.png')
  let absName = expand("%:p") . suffix
  let relName = expand("%:t") . suffix
  execute "!flameshot gui -p " .  absName
  execute "normal! i" . "![Alt Text](./" . relName . ")"
endfunction

command! -nargs=0 Scrot call s:Scrot()
