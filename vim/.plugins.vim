call plug#begin()
" let Vundle manage Vundle, required
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
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
Plug 'trevordmiller/nova-vim'
" Deoplete Neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete Neovim
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mxw/vim-jsx'

" Fix my js <Leader>f
Plug 'ruanyl/vim-fixmyjs'

" Handlebars
Plug 'nono/vim-handlebars'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" neomake
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

Plug 'terryma/vim-multiple-cursors'

"ternternjs/tern_for_vim
Plug 'ternjs/tern_for_vim'

call plug#end()
