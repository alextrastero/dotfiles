call plug#begin()

if executable('tmux')
  Plug 'christoomey/vim-tmux-navigator'
endif

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
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
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'

call plug#end()
