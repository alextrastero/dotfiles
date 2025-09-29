return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "maxmx03/solarized.nvim" },
  { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
