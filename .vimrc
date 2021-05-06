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
let g:netrw_banner=0
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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" neoclide/coc.nvim {{{
let g:coc_global_extensions = [
      \  'coc-lists'
      \, 'coc-git'
      \, 'coc-diagnostic'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-yank'
      \, 'coc-pairs'
      \, 'coc-tsserver'
      \, 'coc-snippets'
      \, 'coc-highlight'
      \, 'coc-prettier'
      \, 'coc-eslint'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-emmet'
      \, 'coc-go'
      \, 'coc-lua'
      \, 'coc-sh'
      \, 'coc-vimlsp'
      \, ]

nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>gd :CocCommand git.showCommit<CR>
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
nnoremap <silent><C-n> :CocCommand explorer --sources=file+ --width=45<CR>
nnoremap <silent><C-w>n :CocCommand explorer --sources=file+ --position=floating --floating-width=10000 --floating-height=10000<CR>
nnoremap <C-p> :CocList gfiles<CR>
nnoremap sj :CocList buffers<CR>
nnoremap sp :CocList vimcommands<CR>
nnoremap sf :CocList files<CR>
nnoremap sg :CocList grep<CR>
nnoremap sy :CocList yank<CR>
nnoremap sc :CocList commits<CR>
nnoremap sb :CocList bcommits<CR>
nnoremap gs :CocList gstatus<CR>
nnoremap so :CocList outline<CR>
nnoremap s' :CocList cmdhistory<CR>
nmap sd <Plug>(coc-definition)
nmap sq <Plug>(coc-fix-current)
nmap st <Plug>(coc-type-definition)
nmap sh <Plug>(coc-references)
nmap si <Plug>(coc-format)
nmap sq <Plug>(coc-diagnostic)
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
nmap gjc <Plug>(coc-git-keepcurrent)
nmap gjn <Plug>(coc-git-keepincoming)
nmap gjb <Plug>(coc-git-keepboth)

xmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
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

" colors
colorscheme gruvbox

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
nnoremap <Leader>j :tabnew<CR>:e $TASK<CR>
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
