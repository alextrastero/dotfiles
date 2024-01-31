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
opt.listchars = 'trail:?'                   -- trailing spaces
opt.listchars = opt.listchars + 'tab:\\ \\' --tabs
opt.diffopt = opt.diffopt + 'vertical'

vim.g.UltiSnipsSnippetDirectories = { "../snips" }
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"

-- GitGutter
vim.g.gitgutter_map_keys = 1
vim.g.gitgutter_signs = 1
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_sign_added = '│'
vim.g.gitgutter_sign_modified = '│'
vim.g.gitgutter_sign_removed = '│'
vim.g.gitgutter_sign_removed_first_line = '│'
vim.g.gitgutter_sign_removed_first_line = '│'
vim.g.gitgutter_sign_removed_above_and_below = '│'
vim.g.gitgutter_sign_modified_removed = '│'

-- vim.g.sneak#label = 1
-- vim.g.sneak#s_next = 1

-- neoformat
vim.g.neoformat_enabled_python = { 'stylelint' }

vim.cmd[[
  nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
]]

-- git blame
-- Available options: <author>, <committer>, <date>, <committer-date>, <summary>, <sha>
-- vim.g.gitblame_message_template = '<summary> • <date> • <author>'
vim.g.gitblame_display_virtual_text = 0
-- vim.g.gitblame_delay = 1000 -- 1 second
-- vim.g.gitblame_highlight_group = "Question"

--"ack use ag instead
vim.g.ackprg = 'ag --vimgrep'
