local function sessionName()
  return 'mk:' .. require('auto-session.lib').current_session_name()
end

return {
  'nvim-lualine/lualine.nvim',
  event = { "VimEnter" },
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
        {
          'filename',
          path = 4,
        }
      },
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          show_filename_only = true,
          hide_filename_extension = true,
        },
      },
    },
  }
}
