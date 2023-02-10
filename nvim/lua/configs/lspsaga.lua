local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

saga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,
  code_action_lightbulb = {
    enable = false,
  },
})
