"
" vim: set fdc=1 fdm=marker fcs=fold\:\ :
"
" plug {{{1
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
Plug 'gruvbox-community/gruvbox'
Plug 'akkerman/vim-jasmine'

" opening and finding files with fzf {{{2
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" }}}2

" opening and finding files with telescope {{{2
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
" }}}2


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
" plug }}}1
" colors {{{1
if has('termguicolors')
    set termguicolors
    let g:gruvbox_italic=1
    " let g:gruvbox_contrast_dark='soft'
    let g:gruvbox_contrast_dark='medium' " default
    " let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_hls_highlight='orange'
endif
set background=dark
color gruvbox
" colors }}}1
" ack {{{1
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ "$*"
  set grepformat=%f:%l:%c:%m
  " cnoreabbrev ack grep
  cnoreabbrev grepjs grep --js --notestjs
  cnoreabbrev ackjs ack --js --notestjs
  command! -bang -nargs=* Ack
  \ call fzf#vim#grep(
  \   'ack --nogroup --column --color '.<q-args>, 1,
  \   fzf#vim#with_preview(), <bang>0)

  nnoremap <silent> <space>st *<bar>:set hlsearch<bar>:grep --js <c-r><c-w><bar>:copen<cr>
  nnoremap <silent> <space>sj *<bar>:set hlsearch<bar>:grep --js --notestjs <c-r><c-w><bar>:copen<cr>
endif
" ack }}}1
" jest {{{1
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" jest }}}1

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %{coc#status()}\ %P

set listchars=tab:»·,trail:·

nnoremap <leader>n :set hlsearch!<cr>


" Open files located in the same dir as the current file
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
nnoremap <leader>r :r <C-R>=expand("%:.:h") . "/"<CR>


set sessionoptions+=tabpages,globals

set mouse=n
set nowrap

" swapfiles and undo
set directory=~/.cache/nvim/swap//
set undodir=~/.cache/nvim/undo//
set undofile
" CocInstall coc-tsserver coc-snippets coc-eslint coc-json coc-jest

let &colorcolumn="80,".join(range(120,999),",")

set cursorline

set ignorecase " ignore the case of words when searching
set smartcase  " only ignore case when the search is lowercase

" if has('autocmd')
"     augroup AutoResize
"         autocmd!
"         autocmd VimResized * execute "normal! \<c-w>="
"     augroup END
" endif

" 'copy' window to tabpage instead of moving
nnoremap <leader>wt :$tab split<CR>
nnoremap <c-w><c-t> :tab split<CR>
nnoremap <c-w>t :tab split<CR>

" open file in vscode
nnoremap <leader>vc :!code %&disown<CR>

" open next/previous (file) in quickfix list
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

let g:netrw_banner=0
let g:netrw_liststyle=3 "Tree style

if has('linebreak')
    set linebreak " only wrap certain characters (not in the middle of a word
    set breakindent
    let &showbreak='↳ '
    if exists('&breakindentopt')
        set breakindentopt=shift:2
    endif
endif

set scrolloff=3
set spellcapcheck=  " when adding a word with all lowercase to custom dict, the same word with first capitalized is also added

if has('virtualedit')
    set virtualedit=block " in visual block mode, allow cursor to move where there is not text
endif
