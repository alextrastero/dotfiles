local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  g = {
    name = "LSP",
    i = {":LspInfo<cr>", "Info"},
    r = {":Lspsaga lsp_finder<cr>", "References"},
    --r = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"},
    d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definition"},
    a = {":Lspsaga code_action<cr>", "Code Action"},
    n = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
    s = {":Lspsaga signature_help<cr>", "Signature"},
    o = {"<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostic"},
    h = {"<cmd>lua vim.lsp.buf.document_highlight()<cr>", "Highlight"},
    e = {"<cmd>lua vim.lsp.buf.clear_references()<cr>", "Clear Highlight"},
    t = {"<cmd>Trouble<cr>", "Trouble!"},
  },
  K = {":Lspsaga hover_doc<cr>", "LSP / Hover doc"},
  ["<leader>"] = {
    m = {":FZFMru<cr>", "Fzf mru"},
    f = {":Ag<cr>", "Search"},
    g = {
      name = "Git",
      s = {":vertical G<cr>", "Status"},
      d = {":vertical Git diff %<cr>", "Diff"},
      l = {":vertical Gclog<cr>", "Log"},
      b = {":vertical Git blame<cr>", "BLAME!"},
    },
    t = {
      name = "Gutter",
      t = {":GitGutterLineHighlightsToggle<cr>", "Git Gutter Toggle"}
    },
    c = {
      ["<space>"] = {"<Plug>CommentaryLine", "Comment out"}
    },
  },
}

which_key.setup {}
which_key.register(mappings)
