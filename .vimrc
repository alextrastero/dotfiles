
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Hack to make buffers hide instead of close
set hidden

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

source ~/.vim/.plugins.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
"set cursorline
set numberwidth=2
set foldcolumn=0
set expandtab
set modelines=0
set shiftwidth=2
set tabstop=2
set nowrap
set expandtab
set noswapfile
set nobackup

"searching
set smartcase
set ignorecase
set hlsearch
set incsearch

"set underline
set guicursor+=n:hor20-Cursor/lCursor

"fix whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e

autocmd VimEnter * set nosc

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig,.pdf,*.DS_Store

let conceal_level = 0

source ~/.vim/.mappings.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
if !exists("g:syntax_on")
  syntax enable
endif

let base00 = "#2C3E50" "gray0
let base01 = "#34495E" "gray1
let base02 = "#7F8C8D" "gray2
let base03 = "#95A5A6" "gray3
let base04 = "#BDC3C7" "gray4
let base05 = "#e0e0e0" "gray5
let base06 = "#f5f5f5" "gray6
let base07 = "#ECF0F1" "gray7

let base08 = "#E74C3C" "red
let base09 = "#E67E22" "orange
let base0A = "#F1C40F" "yellow
let base0B = "#2ECC71" "green
let base0C = "#1ABC9C" "green-dark
let base0D = "#3498DB" "blue
let base0E = "#9B59B6" "purple
let base0F = "#be643c" "brown

"filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

let g:gitgutter_sign_column_always = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_javascript_eslint_args = '--ext .js,.jsx'
" Requires global standard and a few more

"Base16 for mvim
if has('gui_running')
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
  set guioptions-=T  " no toolbar

  "dark
  set background=dark
  let g:airline_theme='base16'
  "Colors https://chriskempson.github.io/base16/#flat
  colo base16-flat

  hi clear SignColumn
  "Change Gutter color
  let g:gitgutter_override_sign_column_highlight = 0
  exe 'hi SignColumn guibg='.base00.' guifg='.base0C

  exe 'hi GitGutterAdd guifg='.base0B.' guibg='.base00
  exe 'hi GitGutterChange guifg='.base0A.' guibg='.base00
  exe 'hi GitGutterDelete guifg='.base08.' guibg='.base00
  exe 'hi GitGutterChangeDelete guifg='.base0E.' guibg='.base00

  exe 'hi SyntasticErrorSign guifg='.base08.' guibg='.base00
  exe 'hi SyntasticWarningSign guifg='.base09.' guibg='.base00

  "let g:syntastic_error_symbol = "✗"
  "let g:syntastic_warning_symbol = '⚠'

  let g:syntastic_error_symbol = '❌'
  let g:syntastic_style_error_symbol = '⁉️'
  let g:syntastic_warning_symbol = '⚠️'
  let g:syntastic_style_warning_symbol = '💩'

  " Add symbols
  "let g:gitgutter_sign_added = '✚'
  "let g:gitgutter_sign_modified = '♒︎'
  "let g:gitgutter_sign_removed = '✦'
  "let g:gitgutter_sign_removed_first_line = '⚓︎'
  "let g:gitgutter_sign_modified_removed = '✈︎'

  highlight FoldColumn guifg=white guibg=#043540

  let g:indentLine_color_gui = '#283038'
  "Change search highlihght color
  exe 'hi Search guifg='.base06.' guibg='.base0E
  "Change VISUAL color
  exe 'hi Visual guifg='.base00.' guibg='.base0C
  "Change number color
  exe 'hi LineNr guifg='.base02.' guibg='.base00

  "Change color of bracket highlight | Slows down
  "hi MatchParen ctermbg='NONE' guibg='#3498DB' guifg='NONE'
  hi MatchTag guifg='#E74C3C' guibg='NONE'

  "XML plugin config
  let xml_use_xhtml = 1
  let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx' : 1 }
  let g:mta_use_matchparen_group=0
  let g:mta_set_default_matchtag_color=0

  "Fix closing color in XML
  highlight link xmlEndTag xmlTag

  "light
  "set background=light
  "let g:airline_theme='tomorrow'
  "let g:indentLine_color_gui = '#E7DDED'
  "hi MatchTag guifg='#c82829' guibg='white'
  "colo tomorrow
  "hi MatchParen ctermbg=yellow guifg='white' guibg='#4271ae'
else
  "let g:indentLine_color_term = '444'
  set background=dark
  colo solarized
  let g:indentLine_color_gui = '#E74C3C'
  "colo base16-flat
endif

"new color for past 80 column
exe 'hi ColorColumn guibg='.base01
let &colorcolumn=join(range(81,300),",")

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Airline Config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set noshowmode

"Font Config
"set guifont=Roboto\ Mono\ for\ Powerline:h13
"set guifont=Inconsolata\ for\ Powerline:h14
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
"set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set guifont=Fira\ Code:h12

"hide scrollbar
set guioptions-=L
set guioptions-=r

"hi LineNr guibg=bg
"hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Add space after comment
let g:NERDSpaceDelims = 1

"Ctrl Faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Change cursor color in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" CUSTOM ***************************************
" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('Underlined', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
" END CUSTOM ************************************

"Let js files be treated as JSX
let g:jsx_ext_required = 0

"show commands
set showcmd

" always split windows vertically
set splitbelow
set splitright
set diffopt+=vertical
silent! set splitvertical
if v:errmsg != ''
  cabbrev split vert split
  cabbrev hsplit split
  cabbrev help vert help
  noremap <C-w>] :vert botright wincmd ]<CR>
  noremap <C-w><C-]> :vert botright wincmd ]<CR>
else
  cabbrev hsplit hor split
endif
