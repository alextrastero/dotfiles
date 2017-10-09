call plug#begin()
" let Vundle manage Vundle, required
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
"Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'
"BufExplorer Plug for Vim
Plug 'jlanzarotta/bufexplorer'
"Auto close (X)HTML tags
Plug 'alvan/vim-closetag'
"Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
"quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
"Git wrapper
Plug 'tpope/vim-fugitive'
"Jade plugin
Plug 'digitaltoad/vim-pug'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'mileszs/ack.vim'
"Ctrl p
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'trevordmiller/nova-vim'
" Deoplete Neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete Neovim
Plug 'maxmellon/vim-jsx-pretty'

" Fix my js <Leader>f
Plug 'ruanyl/vim-fixmyjs'

" Handlebars
" Plug 'nono/vim-handlebars'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'terryma/vim-multiple-cursors'

"autocompletion plugins
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'othree/yajs.vim'

" Distraction free mode
" Plug 'junegunn/goyo.vim'

" Solarized theme
" Plug 'altercation/vim-colors-solarized'

" Dracula theme
Plug 'dracula/vim'

" Oceanic Next theme
Plug 'mhartington/oceanic-next'

" Neomake
Plug 'neomake/neomake'

" Colors?
" Plug 'guns/xterm-color-table.vim'

call plug#end()

