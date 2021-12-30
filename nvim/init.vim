let mapleader = ","

call plug#begin('~/.vim/plugged')

if executable('tmux')
  Plug 'christoomey/vim-tmux-navigator'
endif

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'

" WhichKey
Plug 'folke/which-key.nvim'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" git tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comments
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

"Close tags
Plug 'alvan/vim-closetag'

"lualine
Plug 'nvim-lualine/lualine.nvim'

call plug#end()
