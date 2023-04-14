require('telescope').setup({
  defaults = {
    path_display = { "smart" },
    layout_stragegy = "center",
    layout_config = {
      height = 0.99,
      width = 0.99,
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true,
      ignore_current_buffer = true,
    },
  },
  -- other configuration values here
})
