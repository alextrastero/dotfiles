require('telescope').setup({
  defaults = {
    dynamic_preview_title = true,
    -- results_title = "%P",
    -- path_display = { "smart" },
    path_display = { "truncate" },
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
  extensions = {
    recent_files = {
      only_cwd = true,
    },
  },
})
