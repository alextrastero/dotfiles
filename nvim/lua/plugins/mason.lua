return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
      "vtsls",
      "lua-language-server",
      "prettier",
      "eslint_d",
      "stylua",
      "eslint-lsp",
    })
  end,
}
