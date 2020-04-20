setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal suffixesadd+=.js,.mjs

" tabs
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

" setlocal makeprg=yarn\ lint\ --format\ compact
setlocal makeprg=npx\ jest\ %\ --reporters\ jest-vim-reporter

autocmd BufReadPost,BufNewFile *.test.js set syntax=jasmine

let g:javascript_plugin_jsdoc = 1
