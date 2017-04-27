" Vim color file
" Maintainer:	FBIWarnin
" Last Change:	Thu Apr 18 16:55:06 CST 2013

" This color scheme uses a dark grey background.

" First remove all existing highlighting.
set background=dark
hi clear 
if exists("syntax_on")
  syntax reset
endif

let colors_name = "darkmate"

hi Normal	guifg=#E6E1DC	guibg=#55534E	gui=none	ctermfg=255	ctermbg=237
" Groups for syntax highlighting
hi Constant	guifg=#ffa0a0	guibg=#fce94f	gui=none	ctermfg=201
hi Comment	guifg=#bb66ff			gui=none	ctermfg=99
hi Identifier	guifg=#D0D0FF			gui=none	ctermfg=190
hi PreProc	guifg=#A5C261			gui=none	ctermfg=202
hi Statement	guifg=#ff9900			gui=none	ctermfg=154
hi Function	guifg=#9e91ff			gui=none	ctermfg=155
hi String	guifg=#96ff00			gui=none	ctermfg=152
hi Number	guifg=#00c99b			gui=none	ctermfg=87
hi Type		guifg=#D0D0FF			gui=none	ctermfg=47
hi Ignore	guifg=#404040			gui=none	ctermfg=236
hi LineNr	guifg=#858179	guibg=#4B4B4B	gui=none	ctermfg=252	ctermbg=235

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg	guifg=White	guibg=Red	gui=none
hi IncSearch					gui=none
hi ModeMsg					gui=none
hi StatusLine					gui=none
hi StatusLineNC					gui=none
hi VertSplit					gui=none
hi Visual			guibg=#5A647E	gui=none
hi VisualNOS					gui=none
hi DiffText			guibg=Red	gui=none
hi Cursor	guifg=#FFFFFF	guibg=Green	gui=none
hi lCursor	guifg=Black	guibg=Cyan	gui=none
hi Directory	guifg=Cyan			gui=none
hi MoreMsg	guifg=SeaGreen			gui=none
hi NonText	guifg=LightBlue	guibg=grey30	gui=none
hi Question	guifg=Green			gui=none
hi Search	guibg=Yellow	guifg=Black	gui=none
hi SpecialKey	guifg=Cyan			gui=none
hi Title	guifg=Magenta			gui=none
hi WarningMsg	guifg=Red			gui=none
hi WildMenu	guifg=Black	guibg=Yellow	gui=none
hi Folded	guifg=DarkBlue	guibg=LightGrey	gui=none
hi FoldColumn	guifg=DarkBlue	guibg=Grey	gui=none
hi DiffAdd			guibg=DarkBlue	gui=none
hi DiffChange			guibg=DarkMagenta	gui=none
hi DiffDelete	guifg=Blue	guibg=DarkCyan	gui=none
hi CursorColumn			guibg=grey40	gui=none
hi CursorLine			guibg=#333435	gui=none

" vim: sw=2
