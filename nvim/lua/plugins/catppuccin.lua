return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    vim.cmd [[colorscheme catppuccin-macchiato]]

    -- COLORS
    vim.cmd [[set background=dark]]
    --vim.cmd [[colorscheme catppuccin-macchiato]]
    vim.cmd [[hi clear LspReferenceRead]] -- this is not working...
    vim.cmd [[hi link LspReferenceRead IncSearch]]

    -- vim.cmd [[set cursorline]]
    -- vim.cmd [[hi clear CursorLineNR]]
    -- vim.cmd [[hi CursorLine guibg=NONE guifg=NONE]]
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
  end
}
