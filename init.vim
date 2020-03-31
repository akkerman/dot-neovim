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
Plug 'tpope/vim-obsession'

Plug 'cespare/vim-toml'

Plug 'christoomey/vim-tmux-navigator'

" file explorer
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

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
Plug 'gcmt/taboo.vim'

" javascript
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'

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



" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Open files located in the same dir as the current file
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>

set sessionoptions+=tabpages,globals

set mouse=n
set nowrap

" swapfiles and undo
set directory=~/.cache/nvim/swap//
set undodir=~/.cache/nvim/undo//
set undofile
" CocInstall coc-tsserver coc-snippets coc-eslint coc-json coc-jest
