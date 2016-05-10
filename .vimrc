
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

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
set number
set numberwidth=1
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

let conceal_level = 0

source ~/.vim/.mappings.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
if !exists("g:syntax_on")
  syntax enable
endif

"Solarized
if has('gui_running')
  set guioptions-=T  " no toolbar
  set background=light
  colo alextrastero
else
  set background=dark
	colo solarized
endif


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='luna'
let g:airline_theme='tomorrow'
set laststatus=2

"set guifont=Roboto\ Mono\ for\ Powerline:h13
set guifont=Inconsolata\ for\ Powerline:h14

"hide scrollbar
set guioptions-=L
set guioptions-=r

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/.eslintrc.js"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "?"
"highlight SyntasticErrorSign guifg=#d70000 guibg=NONE
"guibg=#043540
"highlight SyntasticWarningSign guifg=#cb4b16 guibg=NONE
"guibg=#043540

highlight FoldColumn guifg=white guibg=#043540

" vertical split borders
"set fillchars+=vert:\

"indentLine customization
let g:indentLine_color_term = 239
"GVim
let g:indentLine_color_gui = '#E7DDED'

"Ctrl Faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"Help CtrlP set initial directory
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Change color of bracket highlight
hi MatchParen ctermbg=yellow guifg='white' guibg='#4271ae'

"Change search highlihght color
hi Search ctermbg=yellow guifg='white' guibg='#718c00'

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

"XML plugin config
let xml_use_xhtml = 1
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx' : 1 }
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
hi MatchTag guifg='#c82829' guibg='white'

"Fix closing color in XML
highlight link xmlEndTag xmlTag

"filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

"show commands
set showcmd

" always split windows vertically
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
