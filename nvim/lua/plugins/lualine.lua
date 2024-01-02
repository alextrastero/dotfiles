return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'WhoIsSethDaniel/lualine-lsp-progress.nvim',
  },
  opts = {
    options = {
      component_separators = { left = '|', right = '|' },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { 'mode', fmt = function(str) return str:sub(1, 1) end }
      },
      lualine_b = {
        { 'branch', icons_enabled = false }
      },
      lualine_c = {
        { 'lsp_progress' }
      },
    },
    tabline = {
      lualine_a = {
        'buffers',
      },
    },
  }
}
