-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_respect_buf_cwd = 1
-- vim.g.nvim_tree_quit_on_open = 1

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup {
  -- disable_netrw       = true,
  -- hijack_netrw        = true,
  -- open_on_setup       = false,
  -- ignore_ft_on_setup  = {},
  -- open_on_tab         = false,
  -- hijack_cursor       = false,
  -- update_cwd          = false,
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true,
  -- },
  renderer = {
    highlight_opened_files = "name",
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
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
  -- actions = {
  --   open_file = {
  --     quit_on_open = true,
  --   },
  -- },
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
    enable      = false,
    update_cwd  = true,
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
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = 'left',
    -- auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
