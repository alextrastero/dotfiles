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
"Jade plugin
"Plug 'digitaltoad/vim-pug'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'mileszs/ack.vim'
"Ctrl p
Plug 'ctrlpvim/ctrlp.vim'
" Nerdtree
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
" Color
Plug 'lifepillar/vim-solarized8'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" Linter
Plug 'w0rp/ale'
" FZF using homebrew installation
Plug '/usr/local/opt/fzf'
" Autocompletion
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
