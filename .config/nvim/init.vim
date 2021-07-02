" Settings {{{
set autochdir
set autoindent
set clipboard=unnamed
set clipboard+=unnamedplus
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
set showmatch
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
set list lcs=tab:\|\  
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
let g:loaded_2html_plugin = 1
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
      \, 'coc-tsserver'
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
      \, 'coc-marketplace'
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
nmap sk <Plug>(coc-translator-p)
nmap sr <Plug>(coc-translator-r)
vmap sk <Plug>(coc-translator-pv)
vmap sr <Plug>(coc-translator-rv)
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
if has('nvim')
  command! -nargs=* Term split | terminal <args>
  command! -nargs=* Termv vsplit | terminal <args>
endif
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
"Plug 'easymotion/vim-easymotion'
"" easymotion/vim-easymotion{{{
"map , <Plug>(easymotion-overwin-f)
""}}}
Plug 'phaazon/hop.nvim', { 'branch': 'pre-extmarks' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'chr4/nginx.vim', { 'for': 'conf' }
Plug 'hashivim/vim-terraform', { 'for': ['tf', 'tfvars'] }
"hashivim/vim-terraform"{{{
let g:terraform_fmt_on_save=1
" }}}
" Plug 'puremourning/vimspector'
Plug 'juliosueiras/vim-terraform-completion', { 'for': ['tf', 'tfvars'] }
" puremourning/vimspector {{{
fun! GotoWindow(id)
   :call win_gotoid(a:id)
 endfun
 func! AddToWatch()
   let word = expand("<cexpr>")
   call vimspector#AddWatch(word)
 endfunction
 let g:vimspector_base_dir = expand('$HOME/.config/vim/vimspector-config')
 let g:vimspector_sidebar_width = 60
 nnoremap <leader>sa :call vimspector#Launch()<CR>
 nnoremap <leader>sc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 nnoremap <leader>sv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 nnoremap <leader>sw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 nnoremap <leader>ss :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 nnoremap <leader>so :call GotoWindow(g:vimspector_session_windows.output)<CR>
 nnoremap <leader>si :call AddToWatch()<CR>
 nnoremap <leader>sx :call vimspector#Reset()<CR>
 nnoremap <leader>sX :call vimspector#ClearBreakpoints()<CR>
 nnoremap <leader>st :call vimspector#StepOut()<CR>
 nnoremap <leader>sf :call vimspector#StepInto()<CR>
 nnoremap <leader>ss :call vimspector#StepOver()<CR>
 nnoremap <leader>s_ :call vimspector#Restart()<CR>
 nnoremap <leader>sn :call vimspector#Continue()<CR>
 nnoremap <leader>src :call vimspector#RunToCursor()<CR>
 nnoremap <leader>sh :call vimspector#ToggleBreakpoint()<CR>
 nnoremap <leader>se :call vimspector#ToggleConditionalBreakpoint()<CR>
 let g:vimspector_sign_priority = {
   \    'vimspectorBP':         998,
   \    'vimspectorBPCond':     997,
   \    'vimspectorBPDisabled': 996,
   \    'vimspectorPC':         999,
   \ }
"}}}
Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' }
" segeljakt/vim-silicon{{{
let g:silicon = {
      \  'theme':              'gruvbox',
      \  'font':                  'Victor Mono',
      \  'background':         '#ffffff',
      \  'shadow-color':       '#555555',
      \  'line-pad':                   2,
      \  'pad-horiz':                 40,
      \  'pad-vert':                 50,
      \  'shadow-blur-radius':         0,
      \  'shadow-offset-x':            0,
      \  'shadow-offset-y':            0,
      \  'line-number':           v:true,
      \  'round-corner':          v:true,
      \  'window-controls':       v:true,
      \ }

let g:silicon['output'] = '~/Desktop/silicon-{time:%H%M%S}.png'
"}}}
Plug 'liuchengxu/vista.vim', { 'on': 'Vista' }
" liuchengxu/vista.vim {{{
nnoremap <Leader>v :Vista!!<CR>
let g:vista_sidebar_width = 40
let g:vista_default_executive = 'coc'
" }}}
Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight!!' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" junegunn/limelight.vim{{{
nnoremap <Leader>l :Limelight!!<CR>
" }}}
Plug 'simeji/winresizer', { 'on': [ 'WinResizerStartFocus', 'WinResizerStartResize'] }
" simeji/winresizer{{{
let g:winresizer_start_key = 'ge'
nnoremap ge :WinResizerStartResize<CR>
" }}}
" Plug 'honza/vim-snippets'
Plug 'akinsho/nvim-toggleterm.lua'
Plug 'scrooloose/vim-slumlord', { 'for': 'uml' }
Plug 'aklt/plantuml-syntax', { 'for': 'uml' }
call plug#end()
" lua eof {{{
lua <<EOF
require"toggleterm".setup{
  size = 100,
  open_mapping = [[<c-t>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '2',
  start_in_insert = true,
  direction = 'horizontal',
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    indent = {
      enable = true
    }
  },
  ensure_installed = 'maintained'
}
vim.api.nvim_set_keymap('n', ',', "<cmd>lua require'hop'.hint_char1()<cr>", {})
EOF
"}}}
"}}}

"Plug 'phaazon/hop.nvim' - highlight {{{
highlight HopNextKey guifg=#ff0000 gui=bold ctermfg=9 cterm=bold
highlight HopNextKey1 guifg=#fe8019 guibg=#262b35 gui=bold ctermfg=208 cterm=bold
highlight HopNextKey2 guifg=#d65d0e guibg=#262b35 ctermfg=166
"}}}

" toggleterm{{{
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <C-\><C-n>:exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> :<c-u>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc>:<c-u>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-w>t :ToggleTermOpenAll<CR>
nnoremap <silent><c-w>T :ToggleTermCloseAll<CR>
"}}}

" Colors {{{
syntax on
set background=dark
colorscheme gruvbox
" colorscheme anynight

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
nnoremap sl /
nnoremap z0 zt
nnoremap gF <C-w>gF
nnoremap ss :sp<CR>
nnoremap sv :vs<CR>
nnoremap sn :tab split<CR>
nnoremap md :r! mdl 
nnoremap <silent> <C-s> :w!<cr>
nnoremap <silent> <C-c> :bd<cr>
nnoremap <silent> <C-q> :q!<cr>
nnoremap <silent> <Leader>h :noh<CR>
nnoremap <silent> <Leader>s :noa w<CR>
nnoremap <silent> <C-w><C-q> :%bd<CR>
nnoremap <Leader>rg :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
nnoremap <silent> su :let @+ = expand("%:p")<cr>
nnoremap <silent> <Leader>d :tabnew<CR>:e $MYVIMRC<CR>
nnoremap <silent> <Leader>j :tabnew<CR>:e $TASK<CR>
nnoremap <silent> <Leader>m :tabnew<CR>:CocCommand explorer ~/kis9a/memos/<CR>
nnoremap <silent> <Leader>b :tabnew<CR>:e $BOX<CR>
" nnoremap <silent> <Leader>s :tabnew<CR>:CocCommand explorer ~/kis9a/snippets/<CR>
nnoremap <silent> <Leader>p :tabnew<CR>:e $PRIVATE<CR>:CocCommand explorer ~/pkis9a/memos/<CR>
nnoremap <silent> <Leader>rl :so $MYVIMRC<CR>
nnoremap <silent> <Leader>o :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <silent> <Leader>O :k<C-u>call append(expand('.'), '')<Cr>j
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

" --- tnnoremap --- {{{
tnoremap <ESC> <C-\><C-n>
" }}}
" }}}

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
    let s .= ' '.no .':['. title . ']'
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

" Statusline{{{
set noshowmode
set noruler
set laststatus=0
set noshowcmd
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <Leader>k :call ToggleHiddenAll()<CR>
"}}}

" Functions {{{
" Trailing {{{
command! Date :r!date "+\%F"
command! Rmt :%s/\s\+$//e
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
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

" GX{{{
if !exists("g:netrw_nogx")
 if maparg('gx','n') == ""
  if !hasmapto('<Plug>NetrwBrowseX')
   nmap <unique> gx <Plug>NetrwBrowseX
  endif
  nno <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<cr>
 endif
 if maparg('gx','v') == ""
  if !hasmapto('<Plug>NetrwBrowseXVis')
   vmap <unique> gx <Plug>NetrwBrowseXVis
  endif
  vno <silent> <Plug>NetrwBrowseXVis :<c-u>call netrw#BrowseXVis()<cr>
 endif
endif
if exists("g:netrw_usetab") && g:netrw_usetab
 if maparg('<c-tab>','n') == ""
  nmap <unique> <c-tab> <Plug>NetrwShrink
 endif
 nno <silent> <Plug>NetrwShrink :call netrw#Shrink()<cr>
endif
" }}}

if exists('$TMUX')
  let dir = fnamemodify(getcwd(), ":t")
  autocmd BufEnter,FocusGained * call system("tmux rename-window " . dir)
  autocmd VimLeave * call system("tmux rename-window zsh")
endif

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
for i in reverse(filter(files, 'filereadable(v:val)'))
  source `=i`
endfor
endfunction

if !empty(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

xnoremap * :<c-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<c-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

function! s:openGitRemote()
  let uri = system("git remote get-url origin")
  if !empty(uri)
    silent execute "!open " . uri
  end
endfunction
nnoremap <silent> <Leader>gr :call <SID>openGitRemote()<CR>

function! s:gitHubSearch()
  let cw = expand("<cword>")
  let uri = "'https://github.com/search?q=language:" . &filetype . "+" . cw . "'"
  silent execute "!open " . uri
endfunction
nnoremap <silent> <Leader>gw :call <SID>gitHubSearch()<CR>

function! s:githubSearchFile()
  let fname = expand('%:t')
  let uri = "'https://github.com/search?q=filename:" . fname ."'"
  silent execute "!open " . uri
endfunction
nnoremap <silent> <Leader>gf :call <SID>GithubSearchFile()<CR>

function! s:getVisualSelection() range
    let s = @a
    silent! normal! gv"ay
    let r = @a
    let @a = s
    return r
endfunction
xnoremap <Leader>g :call <SID>getVisualSelection()<cr>

function! s:getUserInput()
  echohl Question
  call inputsave()
  let input=input("word > ")
  echohl NONE
  call inputrestore()
  echo "\n"
  return input
endfunction

function! s:googleSearch()
  let vs = s:getUserInput()
  if !empty(vs)
    let uri = "'https://www.google.com/search?q=" . vs . "'"
    silent execute "!open " . uri
  end
endfunction
nnoremap <silent> <Leader>gi :call <SID>googleSearch()<CR>

function! s:googleSearchCword()
  let cw = expand("<cword>")
  if !empty(cw)
    let uri = "'https://www.google.com/search?q=" . cw . "'"
    silent execute "!open " . uri
end
endfunction
nnoremap <silent> <Leader>gg :call <SID>googleSearchCword()<CR>

function! s:getCurrent()
" :echo @% 	def/my.txt	directory/name of file (relative to the current working directory of /abc)
" :echo expand('%:t') 	my.txt	name of file ('tail')
" :echo expand('%:p') 	/abc/def/my.txt	full path
" :echo expand('%:p:h')	/abc/def	directory containing file ('head')
" :echo expand('%:p:h:t')	def	First get the full path with :p (/abc/def/my.txt), then get the head of that with :h (/abc/def), then get the tail of that with :t (def)
" :echo expand('%:r') 	def/my	name of file less one extension ('root')
" :echo expand('%:e') 	txt	name of file's extension ('extension')
endfunction

function! s:getBuffers()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! s:some()
  let vs = s:getBuffers()
  echo vs
endfunction
nnoremap <silent> <Leader>gu :call <SID>some()<CR>
" }}}
