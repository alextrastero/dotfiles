local status_ok, which_key = pcall(require, "which-key")
local mappings = vim.api.nvim_set_keymap
vim.g.mapleader = ","

mappings('n', ';', ':', {})
mappings('n', 'qq', ':bd<cr>', {})
mappings('i', '<C-p>', '<C-r>*', {})
mappings('n', '*', '*N', {})

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
    j = {"<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to ERROR"},
    p = {"<cmd>Lspsaga preview_definition<CR>", "Preview Definition"},
    n = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
    s = {":Lspsaga signature_help<cr>", "Signature"},
    o = {"<cmd>lua vim.diagnostic.open_float({focus = false})<cr>", "Diagnostic"},
    h = {"<cmd>lua vim.lsp.buf.document_highlight()<cr>", "Highlight"},
    e = {"<cmd>lua vim.lsp.buf.clear_references()<cr>", "Clear Highlight"},
    t = {"<cmd>Trouble<cr>", "Trouble!"},
  },
  K = {":Lspsaga hover_doc<cr>", "LSP / Hover doc"},
  ["<tab>"] = {":Telescope buffers<cr>", "T Buffers"},
  ["<C-p>"] = {":Telescope find_files<cr>", "T Files"},

  ["<Up>"] = {":resize +5<cr>", "Resize Up"},
  ["<Down>"] = {":resize -5<cr>", "Resize Down"},
  ["<Right>"] = {":vertical resize +5<cr>", "Resize Right"},
  ["<Left>"] = {":vertical resize -5<cr>", "Resize Left"},

  ["<leader>"] = {
    ["1"] = {":bprev<cr>", "Prev buffer"},
    ["2"] = {":bnext<cr>", "Next buffer"},
    ["\\"] = {":NvimTreeFindFile<cr>", "Open file in nvim-tree"},
    e = {":noh<cr>", "Clear Selection"},
    r = {":so $MYVIMRC<cr>", "Reload Config"},
    m = {":Telescope oldfiles<cr>", "T Oldfiles"},
    f = {":Telescope live_grep<cr>", "T Grep"},
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
