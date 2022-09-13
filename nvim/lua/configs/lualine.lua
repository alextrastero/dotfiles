local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup{
  options = {
    section_separators = '',
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,1) end }
    },
  },
}
