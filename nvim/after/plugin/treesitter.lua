local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup {
  context_commentstring = {
    enable = true,
  },
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
  },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = true,
    disable = {}
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
}
