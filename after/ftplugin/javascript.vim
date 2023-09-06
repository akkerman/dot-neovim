setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal suffixesadd+=.js,.mjs

" tabs
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

setlocal makeprg=yarn\ run\ --silent\ lint\ --format\ compact
setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m

" setlocal makeprg=npx\ jest\ --reporters\ jest-vim-reporter

" autocmd BufReadPost,BufNewFile *.test.js set syntax=jasmine

let g:javascript_plugin_jsdoc = 1

let b:surround_{char2nr("c")} = "console.log(\r)"
let b:surround_{char2nr("C")} = "console.log(JSON.stringify(\r, null, 2))"
let b:surround_{char2nr("j")} = "JSON.stringify(\r, null, 2)"
let b:surround_{char2nr("e")} = "${\r}"
let b:surround_{char2nr("d")} = "describe(' ___ ', () => {\r})"

nnoremap <buffer> [<C-c> "zyiwOconsole.log(z)<Esc>
nnoremap <buffer> ]<C-c> "zyiwoconsole.log(z)<Esc>

nnoremap <space>t :TestFile<CR>

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
