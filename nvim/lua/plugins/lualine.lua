local function sessionName()
  return 'mk:' .. require('auto-session.lib').current_session_name()
end

-- local lsp_progress = require('lsp-progress')
-- lsp_progress.setup({
--   -- Spinning icons.
--   spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
--   -- Spinning update time in milliseconds.
--   spin_update_time = 200,
-- })

return {
  'nvim-lualine/lualine.nvim',
  event = { "VimEnter" },
  dependencies = {
    -- 'linrongbin16/lsp-progress.nvim',
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
        sessionName,
        -- require('lsp-progress').progress
        -- require('lsp-progress').progress, { sessionName }
      },
    },
    tabline = {
      lualine_a = {
        'buffers',
      },
    },
  }
}
