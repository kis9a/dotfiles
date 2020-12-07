if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" --- plugins ---
call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'simeji/winresizer'
  Plug 'stefandtw/quickfix-reflector.vim'
  Plug 'airblade/vim-rooter'
  Plug 'SirVer/ultisnips'
  Plug 'unblevable/quick-scope'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kshenoy/vim-signature'
  Plug 'rhysd/vim-grammarous'
  Plug 'liuchengxu/vista.vim'
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx', 'tsx', 'vue', 'markdown'] }
  Plug 'tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
  Plug 'yuezk/vim-js', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  Plug 'leafgarland/typescript-vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'othree/yajs.vim', { 'for': ['js', 'jsx', 'ts', 'tsx'] }
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['js', 'ts', 'jsx', 'tsx'] }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
  Plug 'jparise/vim-graphql', { 'for': 'graphql' }
  Plug 'dstein64/vim-startuptime', { 'on': 'StartupTime' }
call plug#end()

" --- iamcco/markdown-preview.nvim ---
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_echo_preview_url = 1

" --- fatih/vim-go ---
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" --- maxmellon/vim-jsx-pretty ---
let g:vim_jsx_pretty_colorful_config = 1

" ---  alvan/vim-closetag ---
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.vue,*,tsx"

" unblevable/quick-scope
highlight QuickScopePrimary guifg='red' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='cyan' gui=underline ctermfg=81 cterm=underline
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" stefandtw/quickfix-reflector.vim
let g:qf_modifiable = 1
let g:qf_write_changes = 1

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"

" --- junegunn/fzf.vim ---
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> sp :Commands<CR>
nnoremap <silent> sf :Files<CR>
nnoremap <silent> sj :Buffers<CR>
nnoremap <silent> sh :History<CR>
nnoremap <silent> s; :History:<CR>
nnoremap <silent> sl :Lines<CR>
nnoremap <silent> sc :Commits<CR>
nnoremap <silent> sm :Marks<CR>
nnoremap <silent> sg :Rg<CR>
nnoremap <silent> ss :Snippets<CR>

let $FZF_DEFAULT_OPTS="--color=dark --layout=reverse --color=border:#706859,fg:15,bg:-1,hl:1,fg+:#706859,bg+:0,hl+:1 --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
let g:fzf_layout = {  'window': { 'yoffset': 0 ,'width': 1, 'height': 0.45 } }
let g:fzf_buffers_jump = 1
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" ---neoclide/coc ---
nnoremap <silent> c: :CocCommand<CR>
nnoremap <silent> <C-n> :CocCommand explorer --sources=buffer+,file+ --width=50<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> c; :<C-u>CocList<cr>
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cq <Plug>(coc-fix-current)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> ch <Plug>(coc-references)
nmap <silent> cr <Plug>(coc-rename)
nmap <silent> cf <Plug>(coc-format)
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
      \  'coc-pairs'
      \, 'coc-explorer'
      \, 'coc-prettier'
      \, 'coc-snippets'
      \, 'coc-tabnine'
      \, 'coc-word'
      \, 'coc-go'
      \, 'coc-tsserver'
      \, 'coc-json'
      \, 'coc-highlight'
      \, 'coc-git'
      \, 'coc-neosnippet'
      \, 'coc-yaml'
      \, 'coc-dictionary'
      \, 'coc-markdownlint'
      \, 'coc-fzf-preview'
      \, 'coc-vimtex'
      \, 'coc-vimlsp'
      \, ]

nnoremap <Leader>g :Grepper<CR>