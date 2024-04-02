local function sessionName()
  return 'mk:' .. require('auto-session.lib').current_session_name()
end

local git_blame = require('gitblame')

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
        sessionName,
        {
          git_blame.get_current_blame_text,
          cond = git_blame.is_blame_text_available,
        },
      },
    },
    tabline = {
      lualine_a = {
        'buffers',
      },
    },
  }
}
