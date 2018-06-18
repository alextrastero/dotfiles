language en_US

" *************************************

source ~/.vim/.mappings.vim
source ~/.vim/.plugins.vim

" *************************************

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

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
set noshiftround

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
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set termguicolors
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colo solarized8

" Show tabline
let g:airline#extensions#tabline#enabled = 1

" Config deoplete tab
" deoplete tab-complete TODO this is not working
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
nnoremap <silent> <buffer> gb :TernDef<CR>

" CTRLP to ignore .gitignore files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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

" hide status line
set laststatus=0

" add space after comment for NERDcommenter
let NERDSpaceDelims=1

" Webpack to ignore swap files
set dir=$HOME/.vim_tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" Setup ALE linter
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
" If you don't wish to run linters while you type
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" Remove ALE signs
let g:ale_set_signs = 0
let g:ale_lint_on_filetype_changed = 0

" Eliminating delays on ESC in vim
set timeoutlen=1000 ttimeoutlen=0

" Show Gutentag on statusline
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

" Improve omni
set completeopt=longest,menuone

" Open splits on right side
set splitright

" Fix PERFORMANCE
set lazyredraw
set nocursorline
