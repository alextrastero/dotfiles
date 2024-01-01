require('plugins')
require('mappings')
require('options')
require('configs.alpha')
require('configs.cmp')
require('configs.colorizer')
require('configs.indent-blankline')
require('configs.lspconfig')
require('configs.lspsaga')
require('configs.lualine')
require('configs.nvim-tree')
require('configs.telescope')
require('configs.treesitter')
require('configs.trouble')
require('configs.null-ls')

require('impatient')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
