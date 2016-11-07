
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Hack to make buffers hide instead of close
set hidden

" Indent with spaces
set cindent

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

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

set numberwidth=2
set foldcolumn=0
set expandtab
set modelines=0
set shiftwidth=2
set tabstop=2
set nowrap
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

" Auto cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig,.pdf,*.DS_Store
set wildignore+=*/node_modules/*,*/vendor/*

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

source ~/.vim/.mappings.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_gui = '#556873'

set background=dark
colo nova

" NORMAL
let black = "#3C4C55"
let red = "#DF8C8C"
let green = "#A8CE93"
let yellow = "#DADA93"
let blue = "#83AFE5"
let magenta = "#9A93E1"
let cyan = "#7FC1CA"
let white = "#C5D4DD"

" BRIGHT
let bright_black = "#899BA6"
let bright_red = "#F2C38F"
let bright_magenta = "#D18EC2"
let bright_white = "#E6EEF3"

" DECORATION
let decoration_dark = "#1E272C"
let decoration_medium = "#556873"
let decoration_light = "#6A7D89"

" Syntastic hacks
let g:syntastic_warning_symbol = '!'
let g:syntastic_error_symbol = '✗'
hi SyntasticErrorSign guifg='#df8c8c'
hi SyntasticWarningSign guifg='#f2c38f'

hi Normal ctermfg=NONE ctermbg=black
hi Search guibg=#556873 guifg=#DF8C8C
hi Visual guifg=none guibg=#556873 gui=none

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 2
hi IndentGuidesOdd  guibg=#43545e ctermbg=3
hi IndentGuidesEven guibg=none ctermbg=4

let g:xml_syntax_folding = 1
set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth

" Enable syntax highlighting
if !exists("g:syntax_on")
  syntax enable
endif

let g:gitgutter_sign_column_always = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_javascript_eslint_args = '--ext .js,.jsx'
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }
" Requires global standard and a few more

fun! SetScssConfig()
  let scssConfig = findfile('.scss-lint.yml', '.;')
  if scssConfig != ''
    let b:syntastic_scss_scss_lint_args = '--config ' . scssConfig
  endif
endf

autocmd FileType scss :call SetScssConfig()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Color spellbad
let g:syntastic_enable_highlighting = 1
hi SpellBad ctermfg=050 ctermbg=123 guifg=#3c4c55 guibg=#df8c8c
hi SpellCap ctermfg=050 ctermbg=123 guifg=#3c4c55 guibg=#df8c8c
" hi SpellCap ctermfg=040 ctermbg=321 guifg=#890890 guibg=#098098

""=====[ Bracket Highlight ]===================================================
" Disable
let g:loaded_matchparen = 1
hi MatchParen ctermbg=NONE ctermfg=005

""=====[ XML MATCH PAREN ]=====================================================
  "XML plugin config
let xml_use_xhtml = 1
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx' : 1 }
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0

"Fix closing color in XML
hi link xmlEndTag xmlTag

"new color for past 80 column
" hi ColorColumn ctermfg=008 ctermbg=000
" let &colorcolumn=join(range(81,300),",")

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Airline Config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nova'
let g:airline_section_y=''
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

hi FoldColumn guifg=white guibg=#043540
hi VertSplit guibg=NONE guifg=#556873 ctermfg=9 ctermbg=0
set fillchars+=vert:│

" Add space after comment
let g:NERDSpaceDelims = 1

" CUSTOM **************************************
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

" Color different files in nerdtree
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" highlight file in nerdtree
function! ChangeBuffer()
  if bufwinnr(t:NERDTreeBufName) != -1
    exe "normal! :NERDTreeFind\<cr>\<c-w>\<c-w>"
  endif
endfunction
let g:BufExplorerFuncRef = function('ChangeBuffer')

" copy paste
set clipboard+=unnamedplus

" nvim specific CTRL-h mapping issue on OSX
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Save on tmux leave
let g:tmux_navigator_save_on_switch = 1

"filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js,*.erb"

"Set erb files to treat like JS
autocmd BufNewFile,BufRead *.html.erb set syntax=javascript

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 3
" deoplete-ternjs config
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? deoplete#mappings#close_popup() : "\n"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
