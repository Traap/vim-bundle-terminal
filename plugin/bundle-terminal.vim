" {{{ bundle-terminal.vim 

if exists('g:loaded_bundle_terminal')
  finish
endif
let g:loaded_bundle_terminal=1

" -------------------------------------------------------------------------- }}}
" {{{ Terminal and GUI setup. 
"
" Establish setting for gui and non-gui vim sessions.
if has("gui_running")

  " Don't blink normal mode cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkon0

  set guioptions-=e
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=T

  " Set fonts.
  if has("gui_macvim")
    set guifont=Menlo:h13
  else
    set guifont=Lucida_Console:h11
  endif

endif

if has('vim')
  set encoding=utf-8

  let &t_SI.="\e[5 q" "SI = Insert
  let &t_SR.="\e[4 q" "SR = Replace
  let &t_EI.="\e[6 q" "EI = Normal
  set t_vb=

  if exists('$TMUX')
    set term=screen-256color
  endif

  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  if &term =~ '256color'
    set t_ut=
  endif

endif

" No bells.  Period.
set novisualbell
set belloff=all

" Very fast input.
  set ttyfast

" Terminal behavior.
if has('linux')
  behave xterm
elseif has('win64')
  behave mswin
endif

" ------------------------------------------------------------------------o - }}}
