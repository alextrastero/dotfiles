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
opt.scrolloff = 8
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
opt.colorcolumn = "120"
opt.clipboard = opt.clipboard + 'unnamedplus'
opt.list = true
opt.listchars = 'trail:?'     -- trailing spaces
opt.listchars = opt.listchars + 'tab:\\ \\'    --tabs
opt.diffopt = opt.diffopt + 'vertical'

-- Startify dont change dir
vim.g.startify_change_to_dir = 0

-- COLORS
vim.cmd [[set background=light]]
vim.cmd [[colorscheme catppuccin-latte]]
vim.cmd [[hi clear LspReferenceRead]] -- this is not working...
vim.cmd [[hi link LspReferenceRead IncSearch]]
vim.cmd [[set cursorline]]

-- vim.cmd [[hi clear CursorLineNR]]
vim.cmd [[hi CursorLine guibg=NONE guifg=NONE]]
-- vim.cmd [[hi link CursorLineNR Question]]

vim.cmd [[hi Comment gui=italic]]
vim.cmd [[hi clear NvimTreeNormal]]
vim.cmd [[hi link NvimTreeNormal Normal]]
-- vim.cmd [[hi clear SignColumn]]
vim.cmd [[hi! link SignColumn LineNr]]

-- Highlight opened folder in nvim-tree
vim.cmd [[hi NvimTreeOpenedFolderName gui=underline]]
-- hi NvimTreeFolderName

vim.cmd [[hi clear Search]]
vim.cmd [[hi! link Search Visual]]

vim.cmd [[hi link NvimTreeIndentMarker VertSplit]]

