local opt = vim.opt

opt.syntax = 'enable'
opt.guicursor = ''
opt.relativenumber = true
opt.hidden = true
opt.errorbells = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.ignorecase = true
opt.nu = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff=8
opt.showmode = true
opt.showcmd = true
opt.signcolumn = 'yes'
opt.isfname = opt.isfname + '@-@'
opt.autoindent = true
opt.splitbelow = true
opt.splitright = true
opt.cmdheight = 1
opt.updatetime = 50
opt.shortmess = opt.shortmess + 'c'
opt.colorcolumn = "80"
opt.clipboard = opt.clipboard + 'unnamedplus'
opt.list = true
opt.listchars = 'trail:?'     -- trailing spaces
opt.listchars = opt.listchars + 'tab:\\ \\'    --tabs
opt.diffopt = opt.diffopt + 'vertical'

-- Startify dont change dir
vim.g.startify_change_to_dir = 0

-- TODO
-- autocmd BufNewFile,BufRead *.njk set ft=html
