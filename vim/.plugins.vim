call plug#begin()
" let Vundle manage Vundle, required
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
"Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'
"Auto close (X)HTML tags
Plug 'alvan/vim-closetag'
"Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
"quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
"Git wrapper
Plug 'tpope/vim-fugitive'
"Github wrapper
Plug 'tpope/vim-rhubarb'
"Jade plugin
Plug 'christoomey/vim-tmux-navigator'
"Ctrl p
Plug 'ctrlpvim/ctrlp.vim'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Color
Plug 'chriskempson/base16-vim'
" Lightlint + plugins
Plug 'mgee/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
" Linter
Plug 'w0rp/ale'
" FZF using homebrew installation
Plug '/usr/local/opt/fzf'
" Toggle loclist/quickfix <Leader>l
Plug 'Valloric/ListToggle'
call plug#end()
