local which_key_mappings = {
  ["<space>"] = {":bn<cr>", "Next buffer"},
  ["-"] = {":Oil<cr>", "Open parent directory"},
  g = {
    name = "LSP",
    i = {":LspInfo<cr>", "Info"},
    r = {":Lspsaga finder<cr>", "LSP Finder"},
    d = {":Lspsaga goto_definition<cr>", "Go To Definition"},
    a = {":Lspsaga code_action<cr>", "Code Action"},
    j = {":Lspsaga diagnostic_jump_next<cr>", "Diagnostic Jump Next"},
    k = {":Lspsaga diagnostic_jump_prev<cr>", "Diagnostic Jump Prev"},
    p = {":Lspsaga peek_definition<cr>", "Peek Definition"},
    P = {":Lspsaga peek_type_definition<cr>", "Peek Type Def"},
    o = {":Lspsaga outline<cr>", "Outline"},

    n = {":lua vim.lsp.buf.rename()<cr>", "Rename"},
    h = {":lua vim.lsp.buf.document_highlight()<cr>", "Highlight"},
    e = {":lua vim.lsp.buf.clear_references()<cr>", "Clear Highlight"},
    t = {":Trouble diagnostics toggle<cr>", "Trouble!"},
  },
  K = {":Lspsaga hover_doc<cr>", "Hover doc"},
  y = {
    f = {
      n = {":let @+ = expand(\"%\")<cr>", "Yank file name"},
    },
  },
  ["<C-L>"] = {":TmuxNavigateRight<cr>", "Navigate Right"},
  ["<C-H>"] = {":TmuxNavigateLeft<cr>", "Navigate Left"},
  ["<tab>"] = {":Telescope buffers<cr>", "T Buffers"},
  ["<C-b>"] = {":Telescope buffers<cr>", "T Buffers"},
  ["<C-p>"] = {":Telescope find_files<cr>", "T Files"},
  ["<C-s>"] = {":Telescope git_status<cr>", "T Git Status"},
  ["<C-d>"] = {":bd<cr>", "Delete buffer"},
  ["<C-f>"] = {":lua vim.lsp.buf.format()<cr>", "Format buffer"},

  ["<Up>"] = {":resize +5<cr>", "Resize Up"},
  ["<Down>"] = {":resize -5<cr>", "Resize Down"},
  ["<Right>"] = {":vertical resize +5<cr>", "Resize Right"},
  ["<Left>"] = {":vertical resize -5<cr>", "Resize Left"},
  ["<leader>"] = {
    ["<leader>"] = {"<C-^>", "Alternate file"},
    ["1"] = {":bprev<cr>", "Prev buffer"},
    ["2"] = {":bnext<cr>", "Next buffer"},
    k = {":NERDTreeFind<cr>", "Focus file with nerdtree"},
    e = {":noh<cr>", "Clear Selection"},
    m = {":Telescope oldfiles<cr>", "T Oldfiles"},
    s = {":Telescope git_status<cr>", "T status"},
    f = {":Telescope live_grep<cr>", "T Grep"},
    w = {":Telescope grep_string<cr>", "Telescope Grep cursor"},
    g = {
      name = "Git",
      -- s = {":vertical G<cr>", "Status"},
      s = {":Gedit :<cr>", "Status"},
      d = {":vertical Git diff %<cr>", "Diff"},
      l = {":0GcLog<cr>", "Log"},
      b = {":vertical Git blame<cr>", "BLAME!"},
    },
    t = {
      name = "Git Gutter/Blame",
      t = {":GitGutterLineHighlightsToggle<cr>", "Gutter Toggle"},
      x = {":GitGutterUndoHunk<cr>", "Gutter Undo Hunk"},
      b = {":GitBlameToggle<cr>", "Blame Toggle"},
      o = {":GitBlameOpenCommitURL<cr>", "Blame Open URL"},
    },
    c = {
      ["<space>"] = {"<Plug>CommentaryLine", "Comment out"}
    },
  },
}

vim.g.mapleader = ","

return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local mappings = vim.api.nvim_set_keymap
    mappings('n', ';', ':', {})
    mappings('n', 'qq', ':bd<cr>', {})
    mappings('i', '<C-p>', '<C-r>*', {})

    local wk = require('which-key')
    wk.register(which_key_mappings)
  end
}
