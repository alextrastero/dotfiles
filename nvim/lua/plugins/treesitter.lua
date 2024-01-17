return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require 'nvim-treesitter.configs'

    config.setup({
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
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = false,
        disable = {}
      },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    })
  end
}