vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

-- TODO move these to some color lua file
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[hi clear LspReferenceRead]] -- this is not working...
vim.cmd [[hi link LspReferenceRead Todo]]

vim.cmd [[hi clear CursorLineNR]]
vim.cmd [[hi CursorLine guibg=NONE guifg=NONE]]
vim.cmd [[hi link CursorLineNR Question]]

vim.cmd [[hi Comment gui=italic]]
vim.cmd [[hi link NvimTreeFolderName Conceal]]
vim.cmd [[hi link NvimTreeFolderIcon Conceal]]
vim.cmd [[hi link NvimTreeEmptyFolderName Conceal]]
vim.cmd [[hi link NvimTreeOpenedFolderName Conceal]]
vim.cmd [[hi link NvimTreeOpenedFile Conceal]]
