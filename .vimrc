" settings
set autochdir
set autoindent
set clipboard+=unnamedplus
set clipboard=unnamed
set cursorline
set encoding=UTF-8
set expandtab
set foldmethod=marker
set hidden
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set modifiable
set mouse=nv
set nobackup
set noerrorbells
set noruler
set noshowcmd
set noshowmode
set noswapfile
set novisualbell
set nowritebackup
set number relativenumber
set redrawtime=10000
set regexpengine=1
set shiftwidth=2
set shortmess+=c
set showtabline=2
set signcolumn=yes
set smartcase
set spelllang=en_us
set splitright
set switchbuf+=newtab
set synmaxcol=200
set tabpagemax=100
set tabstop=2
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=300
set viminfo="NONE"
set virtualedit=block
set backspace=indent,eol,start

syntax on
filetype on

let mapleader="\<Space>"
let maplocalleader="\,"
let g:netrw_browsex_viewer="open"
let &statusline=' [%n] %y [%f] '
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" junegunn/fzf {{{
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent>gdi :Gdiffsplit@<CR>
nnoremap <silent>sp :Commands<CR>
nnoremap <silent>sf :Files<CR>
nnoremap <silent>sm :Marks<CR>
nnoremap <silent>sg :Rg!<CR>
nnoremap <silent>sj :Buffers<CR>
nnoremap <silent>sl :Lines<CR>
nnoremap <silent>sc :Commits<CR>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
let g:fzf_preview_window = []
let g:fzf_layout = {  'window': { 'yoffset': 0.05 , 'width': 1, 'height': 0.4 } }
"}}}
Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
" tpope/vim-commentary {{{
xnoremap <silent> gc :Commentary<CR>
nnoremap <silent> gc :Commentary<CR>
" }}}
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
" mhinz/vim-grepper {{{
nnoremap <silent>gr :Grepper<CR>
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'ag']
" }}}
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
call plug#end()

" mappings
noremap ; :
noremap : ;

nnoremap x "_x
nnoremap s "_s
nnoremap n nzz
nnoremap N Nzz
nnoremap == gg=G''
nnoremap z0 zt
nnoremap gF <C-w>gF
nnoremap ss :sp<CR>
nnoremap sv :vs<CR>
nnoremap sn :tab split<CR>
nnoremap <C-s> :w!<cr>
nnoremap <C-c> :bd<cr>
nnoremap <C-q> :q!<cr>
nnoremap <Leader>h :noh<CR>
nnoremap <C-w><C-q> :%bd<CR>
nnoremap <Leader>rg :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
nnoremap su :let @+ = expand("%:p")<cr>
nnoremap <Leader>d :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <Leader>rl :so $MYVIMRC<CR>

noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-h> <Left>
noremap! <C-l> <Right>
noremap! <C-d> <BS>
noremap! <C-c> <DEL>

inoremap <C-x> <End><CR>
inoremap <C-o> <Home><CR><Up>
inoremap <C-d> <BS>
inoremap <C-c> <DEL>
inoremap <C-w> <C-\><C-o>db
inoremap <C-r> <C-\><C-o>de
inoremap <C-b> <Esc>bi
inoremap <C-e> <Esc>ea
inoremap <C-f> <C-y>
inoremap <C-i> <C-y>
inoremap <C-]> <Esc><Right>
inoremap <C-]> <Esc><Right>
inoremap <C-s> <Esc>:w!<cr>
inoremap <C-u> <Esc>ui

xnoremap > >gv
xnoremap < <gv
xnoremap <C-k> "zx<Up>"zP`[V`]
xnoremap <C-j> "zx"zp`[V`]

" TabLine {{{
function! s:sid_prefix()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:tb()
  let s='%#TabLineDir# [%{toupper(fnamemodify(getcwd(), ":t"))}] '
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = title
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= ''.no .':['. title . ']'
    let s .= mod
    let s .= '%#TabLineFill#'
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:sid_prefix() . 'tb()'

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>10 10gt
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-w>d :tabclose<CR>
nnoremap <C-w>c :tabnew<CR>
" }}}

" Netrw{{{
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

noremap <silent> <C-N> :call ToggleNetrw()<CR>
"}}}
