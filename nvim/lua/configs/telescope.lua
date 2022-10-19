require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
      -- other layout configuration here
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true,
      ignore_current_buffer = true,
    },
  },
  -- other configuration values here
})
