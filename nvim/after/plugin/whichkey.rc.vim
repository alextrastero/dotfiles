lua << EOF
local wk = require("which-key")

local mappings = {
  g = {
    i = {":LspInfo<cr>", "LSP / Connected Language Servers"},
    r = {":Lspsaga lsp_finder<cr>", "LSP / References"},
    d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "LSP / Definition"},
    a = {":Lspsaga code_action<cr>", "LSP / Code Action"},
    n = {":Lspsaga rename<cr>", "LSP / Rename"},
    s = {":Lspsaga signature_help<cr>", "LSP / Signature"},
  },
  K = {":Lspsaga hover_doc<cr>", "LSP / Hover doc"},
  ["<leader>"] = {
    c = {
      ["<space>"] = {"<Plug>Commentary", "Comment out"}
    }
  },
}

wk.setup {}
wk.register(mappings)
EOF
