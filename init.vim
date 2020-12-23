"
" vim: set fdm=marker fcs=fold\:\ :
"
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'    " gc adds comments
Plug 'tpope/vim-fugitive'      " for git commands and branch in statusbar
Plug 'tpope/vim-repeat'        " enable repeat for supported plugins
Plug 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'       " Case insensitive substitute
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-cucumber'

Plug 'rbong/vim-flog'           " additional stuff for git (graph/log)
Plug 'wellle/targets.vim'       " additional text objects 

Plug 'cespare/vim-toml'

Plug 'christoomey/vim-tmux-navigator'

" markdown
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

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
  cnoreabbrev ackjs grep --js --notestjs
  command! -bang -nargs=* Ack
  \ call fzf#vim#grep(
  \   'ack --nogroup --column --color '.<q-args>, 1,
  \   fzf#vim#with_preview(), <bang>0)
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

function! MoveOrCreateWindow(key) abort
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Move to a split or create one
nnoremap <silent> <Space>mh :call MoveOrCreateWindow('h')<CR>
nnoremap <silent> <Space>mj :call MoveOrCreateWindow('j')<CR>
nnoremap <silent> <Space>mk :call MoveOrCreateWindow('k')<CR>
nnoremap <silent> <Space>ml :call MoveOrCreateWindow('l')<CR>


let &colorcolumn="80,".join(range(120,999),",")

set cursorline
