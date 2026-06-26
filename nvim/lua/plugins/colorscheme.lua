return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "maxmx03/solarized.nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "soft",
      })
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        vim.o.background = "dark"
      end,
      set_light_mode = function()
        vim.o.background = "light"
      end,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-latte",
      colorscheme = "everforest",
    },
  },
}
