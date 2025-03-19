return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = false,
      },
      rename = {
        in_select = false,
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
