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

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-latte",
      colorscheme = "everforest",
    },
  },
}
