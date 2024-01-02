return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    renderer = {
      highlight_opened_files = "name",
      group_empty = true,
      indent_markers = {
        enable = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        show = {
          folder = false,
        },
      },
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_root = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      adaptive_size = true,
      -- height = 30,
      side = 'left',
      -- auto_resize = false,
      -- mappings = {
      --   custom_only = false,
      --   list = {}
      -- },
      number = false,
      relativenumber = false
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  },
  config = function(_, opts)
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require'nvim-tree'.setup(opts)
  end
}
