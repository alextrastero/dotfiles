return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require 'nvim-treesitter.configs'

    config.setup({
      ensure_installed = {
        "typescript",
        "javascript",
        "tsx",
        "html",
        "json",
        "yaml",
        "scss",
        "vim",
        "vimdoc",
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
        enable = true,
      },
      autopairs = {
        enable = true,
      },
    })
  end
}
