local status_ok, which_key = pcall(require, "which-key")
local mappings = vim.api.nvim_set_keymap
vim.g.mapleader = ","

mappings('n', ';', ':', {})
mappings('n', 'qq', ':bd<cr>', {})
mappings('i', '<C-p>', '<C-r>*', {})
 -- mappings('n', '*', ":<c-u>let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<CR>", {})
mappings('n', '<C-f>', ':Neoformat<cr>', {})

if not status_ok then
  return
end

local which_key_mappings = {
  g = {
    name = "LSP",
    i = {":LspInfo<cr>", "Info"},
    r = {":Lspsaga lsp_finder<cr>", "LSP Finder"},
    -- r = {":lua vim.lsp.buf.references()<cr>", "LSP Finder"},
    d = {":Lspsaga goto_definition<cr>", "Go To Definition"},
    a = {":Lspsaga code_action<cr>", "Code Action"},
    -- j = {"<cmd>Lspsaga diagnostic_jump_next<CR>", "Diagnostic Jump Next"},
    j = { function()
      require("lspsaga.diagnostic"):goto_next({
        severity = vim.diagnostic.severity.ERROR
      }) end, "Diagnostic Jump Next"
    },
    k = { function()
      require("lspsaga.diagnostic"):goto_prev({
        severity = vim.diagnostic.severity.ERROR
      }) end, "Diagnostic Prev Next"
    },
    p = {"<cmd>Lspsaga peek_definition<CR>", "Peek Definition"},
    n = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
    s = {":Lspsaga signature_help<cr>", "Signature"},
    o = {":Lspsaga outline<cr>", "Outline"},
    -- o = {"<cmd>lua vim.diagnostic.open_float({focus = false})<cr>", "Diagnostic"},
    h = {"<cmd>lua vim.lsp.buf.document_highlight()<cr>", "Highlight"},
    e = {"<cmd>lua vim.lsp.buf.clear_references()<cr>", "Clear Highlight"},
    t = {"<cmd>Trouble<cr>", "Trouble!"},
  },
  K = {":Lspsaga hover_doc<cr>", "LSP / Hover doc"},
  ["<tab>"] = {":Telescope buffers<cr>", "T Buffers"},
  ["<C-p>"] = {":Telescope find_files<cr>", "T Files"},
  ["<C-d>"] = {":bd<cr>", "Delete buffer"},

  ["<Up>"] = {":resize +5<cr>", "Resize Up"},
  ["<Down>"] = {":resize -5<cr>", "Resize Down"},
  ["<Right>"] = {":vertical resize +5<cr>", "Resize Right"},
  ["<Left>"] = {":vertical resize -5<cr>", "Resize Left"},

  ["<leader>"] = {
    ["1"] = {":bprev<cr>", "Prev buffer"},
    ["2"] = {":bnext<cr>", "Next buffer"},
    ["\\"] = {":NvimTreeToggle<cr>", "Open file in nvim-tree"},
    k = {":NvimTreeToggle<cr>", "Toggle Nvim Tree"},
    e = {":noh<cr>", "Clear Selection"},
    r = {":luafile $MYVIMRC<cr>", "Reload Config"}, -- updated for lua config
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
which_key.register(which_key_mappings)
