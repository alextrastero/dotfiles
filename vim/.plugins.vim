call plug#begin()

if executable('tmux')
  Plug 'christoomey/vim-tmux-navigator'
endif

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'morhetz/gruvbox'
Plug '/usr/local/opt/fzf'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bronson/vim-trailing-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mustache/vim-mustache-handlebars'

call plug#end()
