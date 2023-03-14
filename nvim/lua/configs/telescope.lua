require('telescope').setup({
  defaults = {
    layout_stragegy = "cursor",
    layout_config = {
      -- width = 100,
      -- other layout configuration here
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
