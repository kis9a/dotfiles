if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

let g:colors_name='gruvbox'

function! s:HL(group, fg, ...) 
" Arguments: group, guifg, guibg, gui, guisp
  let fg = a:fg
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif
  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif
  execute join(histring, ' ')
endfunction

let s:gb = {}
let s:gb.dark0_hard  = ['#1d1d1d', 234]
let s:gb.dark0  = ['#212121', 234]
let s:gb.dark0_soft  = ['#32302f', 236]
let s:gb.dark1       = ['#1d1d1d', 234]
let s:gb.dark2       = ['#504945', 239]
let s:gb.dark3       = ['#665c54', 241]
let s:gb.dark4       = ['#7c6f64', 243]
let s:gb.dark4_256   = ['#7c6f64', 243]
let s:gb.gray_245    = ['#928374', 245]
let s:gb.gray_244    = ['#928374', 244]
let s:gb.light0      = ['#fbf1c7', 229]
let s:gb.light1      = ['#ebcdb2', 223]
let s:gb.light2      = ['#d5c4a1', 250]
let s:gb.light3      = ['#bdae93', 248]
let s:gb.light4      = ['#a89984', 246]
let s:gb.light4_256  = ['#a89984', 246]
let s:gb.red     = ['#ff0000', 9]
let s:gb.bright_red     = ['#df5f5f', 167]
let s:gb.bright_green   = ['#b8bb26', 142]
let s:gb.bright_yellow  = ['#fabd2f', 214]
let s:gb.bright_blue    = ['#83a598', 109]
let s:gb.bright_purple  = ['#d3869b', 175]
let s:gb.bright_aqua    = ['#8ec07c', 108]
let s:gb.bright_orange  = ['#fe8019', 208]
let s:gb.neutral_red    = ['#af0000', 124]
let s:gb.neutral_green  = ['#98971a', 106]
let s:gb.neutral_yellow = ['#d79921', 172]
let s:gb.neutral_blue   = ['#458588', 66]
let s:gb.neutral_purple = ['#b16286', 132]
let s:gb.neutral_aqua   = ['#689d6a', 72]
let s:gb.neutral_orange = ['#d65d0e', 166]
let s:gb.faded_red      = ['#9d0006', 88]
let s:gb.faded_green    = ['#79740e', 100]
let s:gb.faded_yellow   = ['#b57614', 136]
let s:gb.faded_blue     = ['#076678', 24]
let s:gb.faded_purple   = ['#8f3f71', 96]
let s:gb.faded_aqua     = ['#427b58', 66]
let s:gb.faded_orange   = ['#af3a03', 130]
let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']
let s:bg = s:gb.dark0_soft
let s:bg0  = s:gb.dark0
let s:bg1  = s:gb.dark1
let s:bg2  = s:gb.dark2
let s:bg3  = s:gb.dark3
let s:bg4  = s:gb.dark4
let s:gray = s:gb.gray_245
let s:fg0 = s:gb.light0
let s:fg1 = s:gb.light1
let s:fg2 = s:gb.light2
let s:fg3 = s:gb.light3
let s:fg4 = s:gb.light4
let s:fg4_256 = s:gb.light4_256
let s:red0 = s:gb.red
let s:red    = s:gb.bright_red
let s:green  = s:gb.bright_green
let s:yellow = s:gb.bright_yellow
let s:blue   = s:gb.bright_blue
let s:purple = s:gb.bright_purple
let s:aqua   = s:gb.bright_aqua
let s:orange = s:gb.bright_orange
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4
let s:gb.gray = s:gray
let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4
let s:gb.fg4_256 = s:fg4_256
let g:terminal_color_0 = s:bg0[0]
let g:terminal_color_8 = s:gray[0]
let g:terminal_color_1 = s:gb.neutral_red[0]
let g:terminal_color_9 = s:red[0]
let g:terminal_color_2 = s:gb.neutral_green[0]
let g:terminal_color_10 = s:green[0]
let g:terminal_color_3 = s:gb.neutral_yellow[0]
let g:terminal_color_11 = s:yellow[0]
let g:terminal_color_4 = s:gb.neutral_blue[0]
let g:terminal_color_12 = s:blue[0]
let g:terminal_color_5 = s:gb.neutral_purple[0]
let g:terminal_color_13 = s:purple[0]
let g:terminal_color_6 = s:gb.neutral_aqua[0]
let g:terminal_color_14 = s:aqua[0]
let g:terminal_color_7 = s:fg4[0]
let g:terminal_color_15 = s:fg1[0]
let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'
let s:hls_cursor = s:orange
let s:number_column = s:none
let s:sign_column = s:bg1
let s:color_column = s:bg1
let s:vert_split = s:bg0
let s:invert_signs = ''
let s:invert_selection = s:inverse
let s:invert_tabline = ''
let s:italicize_comments = s:italic
let s:italicize_strings = ''

hi! link NonText GruvboxBg2
hi! link SpecialKey GruvboxBg2
hi! link VisualNOS Visual
hi! link Directory GruvboxFg3
hi! link Title GruvboxGreenBold
hi! link MoreMsg GruvboxYellowBold
hi! link ModeMsg GruvboxYellowBold
hi! link Question GruvboxOrangeBold
hi! link WarningMsg GruvboxRedBold
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor
hi! link CursorColumn CursorLine
hi! link Statement GruvboxRed
hi! link Conditional GruvboxRed
hi! link Repeat GruvboxRed
hi! link Label GruvboxRed
hi! link Exception GruvboxRed
hi! link Operator Normal
hi! link Keyword GruvboxRed
hi! link Identifier GruvboxBlue
hi! link Function GruvboxGreenBold
hi! link PreProc GruvboxAqua
hi! link Include GruvboxAqua
hi! link Define GruvboxAqua
hi! link Macro GruvboxAqua
hi! link PreCondit GruvboxAqua
hi! link Constant GruvboxPurple
hi! link Character GruvboxPurple
hi! link Boolean GruvboxPurple
hi! link Number GruvboxPurple
hi! link Float GruvboxPurple
hi! link Type GruvboxYellow
hi! link TabLine TabLineFill
hi! link StorageClass GruvboxOrange
hi! link SpellBad GruvboxRedBold
hi! link Structure GruvboxAqua
hi! link Typedef GruvboxYellow
hi! link CocErrorSign GruvboxRedSign
hi! link CocWarningSign GruvboxOrangeSign
hi! link CocInfoSign GruvboxYellowSign
hi! link CocHintSign GruvboxBlueSign
hi! link CocErrorFloat GruvboxRed
hi! link CocWarningFloat GruvboxOrange
hi! link CocInfoFloat GruvboxYellow
hi! link CocHintFloat GruvboxBlue
hi! link CocDiagnosticsError GruvboxRed
hi! link CocDiagnosticsWarning GruvboxOrange
hi! link CocDiagnosticsInfo GruvboxYellow
hi! link CocDiagnosticsHint GruvboxBlue
hi! link CocSelectedText GruvboxRed
hi! link CocCodeLens GruvboxGray
hi! link QuickScopePrimary GruvboxRed
hi! link QuickScopeSecondary GruvboxGreen
hi! link CocExplorerNormalFloat GruvboxFg0
hi! link CocExplorerNormalFloatBorder GruvboxFg0
hi! link CocExplorerFileDirectory GruvboxOrange
hi! link CocExplorerFileDirectory GruvboxRed

call s:HL('GruvboxFg0', s:fg0)
call s:HL('GruvboxFg1', s:fg1)
call s:HL('GruvboxFg2', s:fg2)
call s:HL('GruvboxFg3', s:fg3)
call s:HL('GruvboxFg4', s:fg4)
call s:HL('GruvboxGray', s:gray)
call s:HL('GruvboxBg0', s:bg0)
call s:HL('GruvboxBg1', s:bg1)
call s:HL('GruvboxBg2', s:bg2)
call s:HL('GruvboxBg3', s:bg3)
call s:HL('GruvboxBg4', s:bg4)
call s:HL('GruvboxRed', s:red)
call s:HL('GruvboxRedBold', s:red, s:none, s:bold)
call s:HL('GruvboxGreen', s:green)
call s:HL('GruvboxGreenBold', s:green, s:none, s:bold)
call s:HL('GruvboxYellow', s:yellow)
call s:HL('GruvboxYellowBold', s:yellow, s:none, s:bold)
call s:HL('GruvboxBlue', s:blue)
call s:HL('GruvboxBlueBold', s:blue, s:none, s:bold)
call s:HL('GruvboxPurple', s:purple)
call s:HL('GruvboxPurpleBold', s:purple, s:none, s:bold)
call s:HL('GruvboxAqua', s:aqua)
call s:HL('GruvboxAquaBold', s:aqua, s:none, s:bold)
call s:HL('GruvboxOrange', s:orange)
call s:HL('GruvboxOrangeBold', s:orange, s:none, s:bold)
call s:HL('GruvboxRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GruvboxGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GruvboxYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GruvboxBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GruvboxPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GruvboxAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('GruvboxOrangeSign', s:orange, s:sign_column, s:invert_signs)
call s:HL('Normal', s:fg1, s:bg0)
call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)
call s:HL('Underlined', s:blue, s:none, s:underline)
call s:HL('StatusLine',   s:bg0, s:red0, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)
call s:HL('VertSplit', s:bg0, s:vert_split)
call s:HL('WildMenu', s:blue, s:bg2, s:bold)
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
call s:HL('LineNr', s:bg4, s:number_column)
call s:HL('SignColumn', s:none, s:sign_column)
call s:HL('Folded', s:gray, s:bg1, s:italic)
call s:HL('FoldColumn', s:gray, s:bg1)
call s:HL('Cursor', s:none, s:none, s:inverse)
call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)
call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)
call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)
call s:HL('TabLineFill', s:bg4, s:bg1, s:bold)
call s:HL('TabLineSel', s:red0, s:bg1, s:invert_tabline)
call s:HL('TabLineDir', s:red0, s:bg1, s:bold)
call s:HL('MatchParen', s:none, s:bg3, s:bold)
call s:HL('Pmenu', s:fg1, s:bg2)
call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
call s:HL('PmenuSbar', s:none, s:bg2)
call s:HL('PmenuThumb', s:none, s:bg4)
call s:HL('ColorColumn',  s:none, s:color_column)
call s:HL('Conceal', s:blue, s:none)
call s:HL('CursorLine',s:none, s:bg)
call s:HL('CursorLineNr', s:yellow, s:bg1)
