language en_US

" *************************************

source ~/.vim/.mappings.vim
source ~/.vim/.plugins.vim

" *************************************

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax hi
syntax on

" For plugins to load correctly
filetype plugin indent on

" set no paste
set pastetoggle=<F3>

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" dont wrap lines
set nowrap

"set textwidth=79
set textwidth=0
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
" enable this?
"runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set noshowmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase

" Visualize tabs and newlines
set list
set listchars=tab:……

" Color scheme (terminal)
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" THEME
set background=dark
colo base16-nord
set termguicolors

set showtabline=2

let g:lightline = {
  \ 'active': {
  \   'right': [ ['linter_errors', 'linter_ok'], ['percent'], ['filetype'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'filename': 'LightlineFilename'
  \ },
  \ 'mode_map': {
  \  'n': 'N',
  \  'i': 'I',
  \  'v': 'V',
  \ }
\ }
" let g:lightline.colorscheme = 'gruvbox' " THEME
let g:lightline.colorscheme = 'solarized' " THEME
let g:lightline.tabline = {
  \'left': [['buffers']],
  \'right': [['gitbranch']]
\}

let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
\}
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
  \ 'linter_errors': 'error',
  \ 'linter_ok': 'left',
\ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" CTRLP to ignore .gitignore files
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Disable parens hi
set noshowmatch
let g:loaded_matchparen=1

" Show command completitions
set wildmenu

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" auto close tags for js files
let g:closetag_filenames = '*.html,*.js'

" add space after comment for NERDcommenter
let NERDSpaceDelims=1

" Webpack to ignore swap files
set dir=$HOME/.vim_tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" Setup ALE linter
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_open_list = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['jshint'],
\}
let g:ale_pattern_options = {
\ '.*b3\/.*js$': {'ale_linters': ['jshint'], 'ale_fixers': []},
\ '.*[^b3\/].*js$': {'ale_linters': ['eslint'], 'ale_fixers': ['eslint']}
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
" If you don't wish to run linters while you type
let g:ale_lint_on_text_changed = 'never'
" Remove ALE signs
let g:ale_set_signs = 0
let g:ale_lint_on_filetype_changed = 0

" hi ALEError guibg=red
hi link ALEError ExtraWhitespace

" link between closing tag and opening tag in XML
hi link xmlEndTag xmlTagName

" Eliminating delays on ESC in vim
set timeoutlen=1000 ttimeoutlen=0

" Style vim split
set fillchars+=vert:\.
hi VertSplit guifg=darkgray guibg=NONE

" Color highlighted search result differently
hi IncSearch guifg=red guibg=white

" Improve omni
set completeopt=longest,menuone

" Open splits on right side
set splitright

" Fix PERFORMANCE
set lazyredraw
set nocursorline

" Enable cursor line position tracking:
" set cursorline
" Remove the underline from enabling cursorline:
" hi clear CursorLine
" Set line numbering to red background:
" hi CursorLineNR guibg=NONE
" DESTROYS PERFORMANCE

" FZF Config
let g:fzf_buffers_jump=1
" let g:fzf_layout = { 'down': '100%' }
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

" vim startify bookmarks
let g:startify_bookmarks = [ { 'v': '~/.vimrc' }, { 'm': '~/.vim/.mappings.vim' }, { 'p': '~/.vim/.plugins.vim' }, { 'z': '~/.zshrc' } ]
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['↪  ブックマーク:']  },
      \ { 'type': 'bookmarks', 'header': ['↪  ディレクトリ:']  }
      \ ]
let g:startify_files_number = 5
let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ '.vimrc',
    \ '.plugins.vim',
    \ '.mappings.vim',
    \ '.tmux.conf',
    \ '.zshrc',
    \ ]
let g:startify_change_to_dir = 0
hi StartifyHeader ctermfg=3
let g:startify_custom_header = [
      \'                   .                    ',
      \'   ##############..... ##############   ',
      \'   ##############......##############   ',
      \'     ##########..........##########     ',
      \'     ##########........##########       ',
      \'     ##########.......##########        ',
      \'     ##########.....##########..        ',
      \'     ##########....##########.....      ',
      \'   ..##########..##########.........    ',
      \' ....##########.#########.............  ',
      \'   ..##################.............    ',
      \'     ################.............      ',
      \'     ##############.............        ',
      \'     ############.............          ',
      \'     ##########.............            ',
      \'     ########.............              ',
      \'     ######    .........                ',
      \'                 .....                  ',
      \'                   .                    ',
      \]
" let g:startify_custom_header = [
  " \ '                                ______      ',
  " \ '            __                /\  ____`\    ',
  " \ '   __   __ /\_\    ___ ___    \ \ \___\ \   ',
  " \ '  /\ \ /\ \\/\ \ /` __` __`\   \ \  ____ \  ',
  " \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \   \ \ \___\ \ ',
  " \ '   \ \___/   \ \_\ \_\ \_\ \_\   \ \_______\',
  " \ '    \/__/     \/_/\/_/\/_/\/_/    \/_______/',
  " \ '                                            ',
  " \ ]

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_footer = [
      \' ( ͡° ͜ʖ ͡°)',
      \]

let g:gitgutter_max_signs = 50

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

