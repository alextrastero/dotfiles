return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    -- COLORS
    vim.cmd [[set background=dark]]
    vim.cmd [[colorscheme catppuccin-frappe]]
    vim.cmd [[hi clear LspReferenceRead]] -- this is not working...
    vim.cmd [[hi link LspReferenceRead IncSearch]]

    vim.cmd [[hi Comment gui=italic]]
    vim.cmd [[hi! link SignColumn LineNr]]

    vim.cmd [[hi clear Search]]
    vim.cmd [[hi! link Search Visual]]

    vim.cmd [[hi link NvimTreeIndentMarker VertSplit]]
  end
}
