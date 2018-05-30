language en_US

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500         " Sets how many lines of history VIM has to remember
set hidden              " Hack to make buffers hide instead of close
" set showmatch           " Show matching brackets.
set cindent             " Indent with spaces
set autoread            " Set to auto read when a file is changed from the outside
" set formatoptions+=j    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" vim-plug
source ~/.vim/.plugins.vim

" All of your Plugins must be added before the following line
filetype plugin indent on    " required

set numberwidth=2
set foldcolumn=0
set modelines=0
set nowrap
set noswapfile
set nobackup

" set hlsearch
" set incsearch

" searching I prefer to have smart-case
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t/

" set underline
" set guicursor+=n:hor20-Cursor/lCursor

autocmd VimEnter * set nosc

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
set wildignore+=*/node_modules/*,*/vendor/*,*/bower_components/*

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
" let g:indentLine_color_gui = '#556873'
if (has("termguicolors"))
 " IF COLOR HAS TERM COLORS UNCOMMENT BELOW
 set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set background=dark
" let g:airline_theme='molokai'
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colo ayu
let g:airline_theme='ayu'
hi link jsxCloseTag Function

" hi Normal ctermfg=NONE ctermbg=black
" hi Search guibg=#556873 guifg=#DF8C8C
" hi Visual guifg=none guibg=#556873 gui=none

" IndentLine {{
" let g:indentLine_char = '│'
" let g:indentLine_setColors = 0
" }}

" IndentGuides {{
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_guide_size = 2
" hi IndentGuidesOdd  guibg=#43545e ctermbg=3
" hi IndentGuidesEven guibg=none ctermbg=4
" }}

let g:xml_syntax_folding = 1
set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth

" Enable syntax highlighting
if !exists("g:syntax_on")
  syntax enable
endif

set signcolumn=yes

" Color spellbad
let g:syntastic_enable_highlighting = 1
" hi SpellBad ctermfg=050 ctermbg=123 guifg=#3c4c55 guibg=#df8c8c
" hi SpellCap ctermfg=050 ctermbg=123 guifg=#3c4c55 guibg=#df8c8c

""=====[ Bracket Highlight ]===================================================
let g:loaded_matchparen = 0
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
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='solarized'
" let g:airline_theme='nova'
" let g:airline_theme='dracula'
let g:airline_section_y=''
set laststatus=2
set noshowmode

"Font Config
"set guifont=Roboto\ Mono\ for\ Powerline:h13
" set guifont=Inconsolata\ for\ Powerline:h14
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
"set guifont=Source\ Code\ Pro\ for\ Powerline:h13
" set guifont=Fira\ Code:h12

"hide scrollbar
set guioptions-=L
set guioptions-=r

"hi LineNr guibg=bg
"hi foldcolumn guibg=bg

hi FoldColumn guifg=white guibg=#043540
" hi VertSplit guibg=NONE guifg=#1d2c35 guibg=#fac863
hi VertSplit ctermbg=NONE ctermfg=black

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

" highlight file in nerdtree
" function! ChangeBuffer()
  " if bufwinnr(t:NERDTreeBufName) != -1
    " exe "normal! :NERDTreeFind\<cr>\<c-w>\<c-w>"
  " endif
" endfunction




" let g:BufExplorerFuncRef = function('ChangeBuffer')

" copy paste
set clipboard+=unnamedplus

" nvim specific CTRL-h mapping issue on OSX
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Save on tmux leave
" let g:tmux_navigator_save_on_switch = 1

"filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js,*.erb"

"Set erb files to treat like JS
" autocmd BufNewFile,BufRead *.html.erb set syntax=javascript

" Deoplete
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

" nerdtree colors
" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 " exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 " exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('jade', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('ini', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('md', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('yml', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('config', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('conf', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('json', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('html', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('styl', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('css', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('coffee', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('js', 'none', 'none', 'none', 'none')
" call NERDTreeHighlightFile('php', 'none', 'none', 'none', 'none')

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

if has('nvim')
  set inccommand=nosplit
 endif

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" Remove highlight of exec files
hi NERDTreeExecFile ctermbg=NONE ctermfg=NONE

" overwrite omnifuncs for specific filetypes
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:deoplete#sources['javascript.jsx'] = ['file', 'buffer', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Color tern dropdown
hi Pmenu ctermfg=007 ctermbg=008
hi PmenuSel ctermfg=015 ctermbg=008
" highlight PmenuSbar  ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00
" highlight PmenuThumb ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00

" disable the preview window
set completeopt-=preview

" Trying to disable Tabs
set list
set listchars=tab:»»

" show numbers
set number

set backupcopy=yes

" Highlight CtrlP line
" hi CursorLine guibg=darkred

hi clear CursorLine
hi clear CursorLineNR

" 80 column mark
" highlight ColorColumn ctermbg=235 guifg=white
" let &colorcolumn=join(range(121,999),",")

" Neomake Config
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_scss_enabled_makers = ['stylelint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" Colors Error Symbol Neomake
let g:neomake_error_sign = {
            \ 'texthl': 'ErrorMsg',
            \ }
hi ErrorMsg guifg=#272d39 guibg=white

" Run neomake on every write
autocmd! BufWritePost * Neomake
" autocmd! BufWritePost,BufEnter * Neomake
" autocmd! BufReadPost, BufWritePost * Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Performance improvments
set lazyredraw
" set synmaxcol=128
syntax sync minlines=256
