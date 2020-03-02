"
" vim: set fdm=marker fcs=fold\:\ :
"
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'    " gc adds comments
Plug 'tpope/vim-fugitive'      " for git commands and branch in statusbar
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'        " enable repeat for supported plugins
Plug 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'       " Case insensitive substitute
Plug 'tpope/vim-unimpaired'

Plug 'cespare/vim-toml'

Plug 'christoomey/vim-tmux-navigator'

" colors
Plug 'morhetz/gruvbox'
Plug 'akkerman/vim-jasmine'

" opening and finding files
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

Plug 'chr4/nginx.vim'

Plug 'godlygeek/tabular'

" javascript
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'

call plug#end()

set background=dark
color gruvbox


if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ "$*"
  set grepformat=%f:%l:%c:%m
  cnoreabbrev ack grep
endif

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %{coc#status()}\ %P

set listchars=tab:»·,trail:·

nnoremap <leader>n :set hlsearch!<cr>

" CocInstall coc-snippets
