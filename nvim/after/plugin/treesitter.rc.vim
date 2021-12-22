if !exists('g:loaded_nvim_treesitter') | finish | endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "typescript",
    "tsx",
    "html",
    "json",
    "scss",
    "vim",
    "css",
    "bash",
    "lua",
  },
  hightlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  }
}
EOF
