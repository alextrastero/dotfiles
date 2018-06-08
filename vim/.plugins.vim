call plug#begin()
" let Vundle manage Vundle, required
"Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
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

" Fix my js <Leader>f
"Plug 'ruanyl/vim-fixmyjs'

" Handlebars
"Plug 'nono/vim-handlebars'

" Nerdtree
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'

"autocompletion plugins
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'othree/yajs.vim'

" Color
Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linter
Plug 'w0rp/ale'

call plug#end()
