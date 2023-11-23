local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup{
  options = {
    -- section_separators = '',
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'},
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,1) end }
    },
    lualine_b = {
      { 'branch', icons_enabled = false }
    },
    lualine_c = {
      { 'lsp_progress' }
    },
    lualine_x = {
      { 'copilot', icons_enabled = false }
    },
  },
  tabline = {
    lualine_a = {
      'buffers',
    },
  },
}
