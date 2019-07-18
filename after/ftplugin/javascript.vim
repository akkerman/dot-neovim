setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal suffixesadd+=.js,.mjs

" tabs
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

setlocal makeprg=yarn\ lint\ --format\ compact
