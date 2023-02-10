local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing Packer')
  vim.cmd(':!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'gruvbox-community/gruvbox'
  use 'tpope/vim-fugitive'
  use 'neovim/nvim-lspconfig'
  use { 'glepnir/lspsaga.nvim', branch = 'main' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'christoomey/vim-tmux-navigator'

  use 'folke/which-key.nvim'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- git tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use 'ap/vim-buftabline'
  use 'airblade/vim-gitgutter'

  -- Comments
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Close tags
  use 'windwp/nvim-ts-autotag'

  -- lualine
  use 'nvim-lualine/lualine.nvim'

  -- change case
  use 'tpope/vim-abolish'

  -- indent blankline
  use 'lukas-reineke/indent-blankline.nvim'

  -- testing trouble
  use 'folke/trouble.nvim'

  -- prettier
  use 'sbdchd/neoformat'

  -- impatient
  use "lewis6991/impatient.nvim"

  -- astro highlight
  use "wuelnerdotexe/vim-astro"
end)
