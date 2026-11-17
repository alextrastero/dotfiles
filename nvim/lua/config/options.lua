-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.snacks_animate = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- highlight only the current line number, not the line
vim.opt.swapfile = false
vim.opt.guicursor = ""
-- vim.opt.colocolumn = "120"
vim.go.background = "dark"
vim.opt.wildmode = "full"

-- disable auto format globally
vim.g.autoformat = false
