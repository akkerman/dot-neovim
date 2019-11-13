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

Plug 'christoomey/vim-tmux-navigator'

" colors
Plug 'morhetz/gruvbox'

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


set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %{coc#status()}\ %P


nmap <silent> <F2> <Plug>(coc-diagnostic-next)
nmap <silent> <F3> <Plug>(coc-diagnostic-prev)


set listchars=tab:»·,trail:·

nnoremap <leader>n :set hlsearch!<cr>


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
