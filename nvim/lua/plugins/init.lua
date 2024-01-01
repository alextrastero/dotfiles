return {
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'neovim/nvim-lspconfig',
  { 'glepnir/lspsaga.nvim', branch = 'main' },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  -- Completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',

  'christoomey/vim-tmux-navigator',

  'folke/which-key.nvim',

  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',
  { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' },

  -- git tree
  'nvim-tree/nvim-tree.lua',

  'ap/vim-buftabline',
  'airblade/vim-gitgutter',

  -- Comments
  'tpope/vim-commentary',
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Close tags
  'windwp/nvim-ts-autotag',

  -- lualine
  'nvim-lualine/lualine.nvim',

  -- change case
  'tpope/vim-abolish',

  -- indent blankline
  'lukas-reineke/indent-blankline.nvim',

  -- testing trouble
  'folke/trouble.nvim',

  -- prettier
  'sbdchd/neoformat',

  -- impatient
  "lewis6991/impatient.nvim",

  -- astro highlight
  "wuelnerdotexe/vim-astro",

  -- highlight hex color values
  'NvChad/nvim-colorizer.lua',

  -- alpha
  'goolord/alpha-nvim',

  -- git-blame
  'f-person/git-blame.nvim',

  -- trying null-ls
  'nvimtools/none-ls.nvim',

  -- search inside vim WTF
  'mileszs/ack.vim',

  -- lsp progress
  'WhoIsSethDaniel/lualine-lsp-progress.nvim',
}
