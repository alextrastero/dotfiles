local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup {
  -- removed due to deprecation
  -- context_commentstring = {
  --   enable = true,
  -- },
  ensure_installed = {
    "typescript",
    "tsx",
    "html",
    "json",
    "scss",
    "vim",
    "css",
    "bash",
    "lua",
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
    -- disable = {},
    -- additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false,
    disable = {}
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
