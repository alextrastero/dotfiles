local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup({
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
});

-- require('telescope').setup({
--   defaults = {
--     dynamic_preview_title = true,
--     -- results_title = "%P",
--     -- path_display = { "smart" },
--     path_display = { "truncate" },
--     layout_stragegy = "center",
--     layout_config = {
--       height = 0.99,
--       width = 0.99,
--     },
--   },
--   sorting_strategy = "descending",
--   pickers = {
--     find_files = {
--       hidden = true,
--     },
--     buffers = {
--       sort_lastused = true,
--       sort_mru = true,
--       ignore_current_buffer = true,
--     },
--     lsp_references = {
--       path_display = { "smart" },
--       theme = "dropdown",
--       layout_config = {
--         height = 0.29,
--         width = 0.99,
--         prompt_position = 'top',
--       },
--     },
--   },
--   extensions = {
--     frecency = {},
--     recent_files = {
--       only_cwd = true,
--     },
--   },
-- })
