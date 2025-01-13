return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
      -- definition = {
      --   width = 1,
      --   height = 1,
      -- },
      -- implement = {
      --   virtual_text = false,
      -- },
      -- finder = {
      --   layout = "normal",
      -- },
    })
  end,
}
