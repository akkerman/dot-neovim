"
" vim: set fdm=marker fcs=fold\:\ :
"
call functions#PlugLoad() " {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'    " gc adds comments
Plug 'tpope/vim-fugitive'      " for git commands and branch in statusbar
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'        " enable repeat for supported plugins
Plug 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'       " Case insensitive substitute

" colors
Plug 'morhetz/gruvbox'

" opening and finding files
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}

set background=dark
color gruvbox
