set wrap
set linebreak
set nolist
set spelllang=nl
setlocal spell

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" set makeprg="pandoc %:p -o %:p:r.pdf"
let &l:makeprg = "pandoc -s --pdf-engine=xelatex -F mermaid-filter --metadata-file ~/.pandoc/metadata.yml -H ~/.pandoc/header.tex ".shellescape(expand("%:p"))." -o ".shellescape(expand("%:p:r").".pdf")
" let &l:makeprg = "pandoc -s -H ~/.pandoc/header.tex ".shellescape(expand("%:p"))." -o ".shellescape(expand("%:p:r").".pdf")
" set errorformat="%f",\ line\ %1:\ %m
"
"
setlocal suffixesadd+=.md,.markdown
