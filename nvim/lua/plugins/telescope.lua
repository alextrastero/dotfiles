return {
  {
    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
    'nvim-telescope/telescope-ui-select.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
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
  },
}
