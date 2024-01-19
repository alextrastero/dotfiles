return {
  'nvim-telescope/telescope.nvim',
  opts = {
    defaults = {
      dynamic_preview_title = true,
      path_display = { "truncate" },
    },
    pickers = {
      find_files = {
        -- theme = "dropdown",
        hidden = true,
        layout_config = {
          width = 0.99,
          preview_cutoff = 0.99,
        },
        -- layout_config = {
        --   width = 0.99,
        -- },
      },
      buffers = {
        sort_lastused = true,
        sort_mru = true,
        ignore_current_buffer = true,
      },
    },
  },
}
