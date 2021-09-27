setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal suffixesadd+=.js,.mjs

" tabs
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

setlocal makeprg=yarn\ run\ --silent\ lint\ --format\ compact
setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
setlocal errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m

" setlocal makeprg=npx\ jest\ %\ --reporters\ jest-vim-reporter

autocmd BufReadPost,BufNewFile *.test.js set syntax=jasmine

let g:javascript_plugin_jsdoc = 1

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
