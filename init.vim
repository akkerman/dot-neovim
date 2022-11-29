"
" vim: set fdc=1 fdm=marker fcs=fold\:\ :
"
" plug {{{1
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'    " gc adds comments
Plug 'tpope/vim-repeat'        " enable repeat for supported plugins
Plug 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'       " Case insensitive substitute
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-cucumber'

" GIT
Plug 'tpope/vim-fugitive'            " for git commands and branch in statusbar
Plug 'tpope/vim-rhubarb'             " enable :GBrowse for github
Plug 'shumphrey/fugitive-gitlab.vim' " enable :GBrowse for gitlab
Plug 'airblade/vim-gitgutter'

Plug 'wellle/targets.vim'       " additional text objects 

Plug 'cespare/vim-toml'

" tmux
" Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

" markdown
" Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ellisonleao/glow.nvim'

" file explorer
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" colors
Plug 'gruvbox-community/gruvbox'
Plug 'romgrk/doom-one.vim'

" opening and finding files with fzf {{{2
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
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

" javascript {{{2
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'akkerman/vim-jasmine-fold'
Plug 'jpalardy/vim-slime'
Plug 'digitaltoad/vim-pug'
" }}}2

Plug 'vim-test/vim-test'
Plug 'neomake/neomake'


" Plug 'jceb/vim-orgmode'
" Plug 'kristijanhusak/orgmode.nvim'
Plug 'nvim-orgmode/orgmode'

Plug 'chazmcgarvey/vim-mermaid'
Plug 'aklt/plantuml-syntax'

Plug 'urso/haskell_syntax.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'udalov/kotlin-vim'

call plug#end()
" plug }}}1
" colors {{{1
if has('termguicolors')
    set termguicolors
    let g:gruvbox_italic=1
    let g:gruvbox_contrast_dark='soft'
    " let g:gruvbox_contrast_dark='medium' " default
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
  cnoreabbrev ackjs grep --js --notestjs
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

set statusline=%<%f\ %h%m%r%{ObsessionStatus()}%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %{coc#status()}\ %P

set listchars=tab:»·,trail:·

nnoremap <leader>n :set hlsearch!<cr>


" Open files located in the same dir as the current file
nnoremap <leader>e :e <C-R>=expand("%:.:h") . "/"<CR>
nnoremap <leader>r :r <C-R>=expand("%:.:h") . "/"<CR>
nnoremap <leader>lcd :c <C-R>=expand("%:.:h") . "/"<CR>

" make current file executable
nnoremap <leader>fx :!chmod +x %<CR>


set sessionoptions+=tabpages,globals

set mouse=n
set nowrap

" swapfiles and undo
set directory=~/.cache/nvim/swap//
set undodir=~/.cache/nvim/undo//
set undofile
" CocInstall coc-tsserver coc-snippets coc-eslint coc-json coc-jest coc-yaml

let &colorcolumn="80,120"

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
nnoremap <c-w>z :wincmd_<cr>:wincmd<bar><cr>

" open file in vscode
nnoremap <leader>vc :!code %&disown<CR>
" open file in emacs
nnoremap <leader>ve :!emacsclient -c % <CR>

" open next/previous (file) in quickfix list
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" stable/center cursor
nnoremap J mzJ`z
" nnoremap n nzzzv
" nnoremap N Nzzzv

" goto file in split
nnoremap gF <c-w>v gf

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

" apply last edit to selected lines
xmap <silent> . :normal .<cr>

let g:netrw_browsex_viewer='/usr/bin/xdg-open'
nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR>
