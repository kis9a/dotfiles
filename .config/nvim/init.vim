" Settings {{{
set autochdir
set autoindent
set clipboard+=unnamedplus
set clipboard=unnamed
set cursorline
set encoding=UTF-8
set expandtab
set foldmethod=marker
set hidden
set ignorecase
set laststatus=2
set lazyredraw
set modifiable
set mouse=nv
set nobackup
set nowritebackup
set noerrorbells
set noruler
set noshowcmd
set noshowmode
set noswapfile
set novisualbell
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
let mapleader="\<Space>"
let maplocalleader="\,"
let g:netrw_browsex_viewer="open"
let &statusline=' [%n] %y [%f] '
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin = 1
let g:loaded_man = 1
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_rrhelper = 1
" let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_shada_plugin = 1
let g:loaded_shada_autoload = 1
let g:loaded_sql_completion = 1
let g:loaded_msgpack_autoload = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_matchparen = 1
let g:loaded_matchit = 1
let g:loaded_dbext = 1
" }}}

" Plugins {{{
" vim-plug Installation {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
"}}}
" :PlugSnapshot{{{
silent! let g:plugs['coc.nvim'].commit = 'd3e40ceabd76323c07434fc2711521cc8bb2d028'
silent! let g:plugs['indentLine'].commit = '5617a1cf7d315e6e6f84d825c85e3b669d220bfa'
silent! let g:plugs['nvim-treesitter'].commit = '11e1db3ec29abb5711556085766cb6912814c6dc'
silent! let g:plugs['quick-scope'].commit = 'd4c02b85ff168f7749833607536cb02281464c26'
silent! let g:plugs['vim-commentary'].commit = '349340debb34f6302931f0eb7139b2c11dfdf427'
silent! let g:plugs['vim-easymotion'].commit = 'd75d9591e415652b25d9e0a3669355550325263d'
silent! let g:plugs['vim-grepper'].commit = 'e9004ce564891412cfe433cfbb97295cccd06b39'
silent! let g:plugs['vim-rooter'].commit = '544e701066c69bbeb45297d0285c2719e125440b'
silent! let g:plugs['vim-surround'].commit = 'f51a26d3710629d031806305b6c8727189cd1935'
" :PlugUpdate!
"}}}

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" neoclide/coc.nvim {{{
let g:coc_global_extensions = [
      \  'coc-lists'
      \, 'coc-git'
      \, 'coc-diagnostic'
      \, 'coc-explorer'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-yank'
      \, 'coc-pairs'
      \, 'coc-snippets'
      \, 'coc-highlight'
      \, 'coc-translator'
      \, 'coc-prettier'
      \, 'coc-eslint'
      \, 'coc-clangd'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-emmet'
      \, 'coc-go'
      \, 'coc-json'
      \, 'coc-lua'
      \, 'coc-markdownlint'
      \, 'coc-rust-analyzer'
      \, 'coc-phpls'
      \, 'coc-sh'
      \, 'coc-toml'
      \, 'coc-vimlsp'
      \, 'coc-yaml'
      \, 'coc-xml'
      \, ]

nnoremap <silent>s: :CocCommand<CR>
nnoremap <silent>s; :<C-u>CocList<cr>
nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>gd :CocCommand git.showCommit<CR>
nnoremap <silent>sk :CocCommand prettier.formatFile<CR>
nnoremap <silent><C-n> :CocCommand explorer --sources=file+ --width=45<CR>
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
nmap sk <Plug>(coc-translator-p)
nmap sr <Plug>(coc-translator-r)
vmap sk <Plug>(coc-translator-pv)
vmap sr <Plug>(coc-translator-rv)
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)
nmap gjc <Plug>(coc-git-keepcurrent)
nmap gjn <Plug>(coc-git-keepincoming)
nmap gjb <Plug>(coc-git-keepboth)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
"}}}
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
" mhinz/vim-grepper {{{
nnoremap <silent>gr :Grepper<CR>
nnoremap gp :Grepper-
nnoremap gk :Grepper-cd<CR>
nnoremap gb :Grepper-buffer<CR>
"}}}
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'unblevable/quick-scope'
" unblevable/quick-scope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
"}}}
Plug 'Yggdroot/indentLine'
" Yggdroot/indentLine {{{
let g:indentLine_faster = 1
let g:indentLine_char_list = ['¦', '┆', '┊']
"}}}
Plug 'easymotion/vim-easymotion'
" easymotion/vim-easymotion{{{
map , <Plug>(easymotion-overwin-f)
"}}}
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight!!' }
" junegunn/limelight.vim{{
nnoremap <Leader>l :Limelight!!<CR>
" }}}
Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }
" simeji/winresizer{{{
nnoremap ge :WinResizerStartResize<CR>
" }}}

call plug#end()
" vim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    indent = {
      enable = true
    }
  },
  ensure_installed = 'all'
}
EOF
"}}}
"}}}

" Colors {{{
syntax on
set background=dark
colorscheme gruvbox

if exists("&termguicolors") && exists("&winblend")
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
endif
"}}}

" Maps {{{
" --- noremap --- {{{
noremap ; :
noremap : ;
"  }}}

" --- nnoremap --- {{{
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
nnoremap md :r! mdl 
nnoremap <silent> <C-s> :w!<cr>
nnoremap <silent> <C-c> :bd<cr>
nnoremap <silent> <C-q> :q!<cr>
nnoremap <silent> <C-w><C-q> :%bd<CR>
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
nnoremap <silent> su :let @+ = expand("%:p")<cr>
nnoremap <silent> <Leader>d :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <silent> <Leader>j :tabnew<CR>:e $MEMOS<CR>
nnoremap <silent> <Leader>rl :so $MYVIMRC<CR>
nnoremap <silent> <Leader>o :set spell!<CR>
" }}}

" --- nnoremap! ---{{{
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-h> <Left>
noremap! <C-l> <Right>
noremap! <C-d> <BS>
noremap! <C-c> <DEL>
"}}}

" --- inoremap --- {{{
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
"}}}

" --- xnoremap --- {{{
xnoremap > >gv
xnoremap < <gv
xnoremap <C-k> "zx<Up>"zP`[V`]
xnoremap <C-j> "zx"zp`[V`]
xnoremap <Leader>r y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
xnoremap <silent> <Leader>i :'<,'>!tail -r<CR>
xnoremap <silent> cy c<C-r>0<ESC>:let @/=@1<CR>:noh<CR>"
xnoremap <silent> <Leader>t :'<,'> !trans -b -sl=en -tl=ja<CR>
xnoremap <silent> <Leader>w :'<,'>w !trans -b -sl=en -tl=ja<CR>
" }}}
" }}}

" Functions {{{

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
"}}}

" Trailing {{{
command! Rmt :%s/\s\+$//e
match errorMsg /\s\+$/
" }}}

" QF {{{
function! s:toggle_qf()
  let l:nr = winnr('$')
  cwindow
  let l:nr2 = winnr('$')
  if l:nr == l:nr2
    cclose
  endif
endfunction
nnoremap <silent> <Leader>q :call <SID>toggle_qf()<CR>
" }}}
" }}}

" au BufWritePost *.js,*.scss :!node-sass ~/Downloads/app_578/scss/dist.scss ~/Downloads/app_578/custom.css
" au BufWritePost *.js,*.scss :!node-sass ~/Downloads/a/scss/dist.scss ~/Downloads/a/custom.css
au BufWritePost *.js,*.scss :!node-sass /Users/evolany16/Downloads/a/scss/dist.scss /Users/evolany16/Downloads/b/custom.css
