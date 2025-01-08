return {
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'nvim-lua/plenary.nvim',

  'christoomey/vim-tmux-navigator',

  'airblade/vim-gitgutter',

  -- Comments
  'tpope/vim-commentary',
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Close tags
  'windwp/nvim-ts-autotag',

  -- change case
  'tpope/vim-abolish',

  -- prettier
  'sbdchd/neoformat',

  -- astro highlight
  "wuelnerdotexe/vim-astro",

  -- git-blame
  {
    'f-person/git-blame.nvim',
    opts = {
      message_template = '<author> • <date>',
      date_format = '%r',
      message_when_not_committed = 'nope',
    },
  },

  {
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 1,
    },
  },

  -- search inside vim WTF
  'mileszs/ack.vim',

  -- mini pairs
  'echasnovski/mini.nvim',

  'tpope/vim-unimpaired',
}
