local which_key_mappings = {
  { "<space>",          ":bn<cr>",                                   desc = "Next buffer" },
  { "-",                ":Oil --float<cr>",                          desc = "Open parent directory" },

  { "g",                group = "LSP" },
  { "gi",               ":LspInfo<cr>",                              desc = "Info" },
  { "gr",               ":Lspsaga finder<cr>",                       desc = "LSP Finder" },
  { "gd",               ":Lspsaga goto_definition<cr>",              desc = "Go To Definition" },
  { "ga",               ":Lspsaga code_action<cr>",                  desc = "Code Action" },
  { "gj",               ":Lspsaga diagnostic_jump_next<cr>",         desc = "Diagnostic Jump Next" },
  { "gk",               ":Lspsaga diagnostic_jump_prev<cr>",         desc = "Diagnostic Jump Prev" },
  { "gp",               ":Lspsaga peek_definition<cr>",              desc = "Peek Definition" },
  { "gP",               ":Lspsaga peek_type_definition<cr>",         desc = "Peek Type Def" },
  { "go",               ":Lspsaga outline<cr>",                      desc = "Outline" },
  { "gn",               ":lua vim.lsp.buf.rename()<cr>",             desc = "Rename" },
  { "gh",               ":lua vim.lsp.buf.document_highlight()<cr>", desc = "Highlight" },
  { "ge",               ":lua vim.lsp.buf.clear_references()<cr>",   desc = "Clear Highlight" },
  { "gt",               ":Trouble diagnostics toggle<cr>",           desc = "Trouble!" },

  { "K",                ":Lspsaga hover_doc<cr>",                    desc = "Hover doc" },

  { "yfn",              ":let @+ = expand(\"%\")<cr>",               desc = "Yank file name" },

  { "<C-L>",            ":TmuxNavigateRight<cr>",                    desc = "Navigate Right" },
  { "<C-H>",            ":TmuxNavigateLeft<cr>",                     desc = "Navigate Left" },
  { "<tab>",            ":Telescope buffers<cr>",                    desc = "T Buffers" },
  { "<C-b>",            ":Telescope buffers<cr>",                    desc = "T Buffers" },
  { "<C-p>",            ":Telescope find_files<cr>",                 desc = "T Files" },
  { "<C-s>",            ":Telescope git_status<cr>",                 desc = "T Git Status" },
  { "<C-d>",            ":bd<cr>",                                   desc = "Delete buffer" },
  { "<C-f>",            ":lua vim.lsp.buf.format()<cr>",             desc = "Format buffer" },

  { "<Up>",             ":resize +5<cr>",                            desc = "Resize Up" },
  { "<Down>",           ":resize -5<cr>",                            desc = "Resize Down" },
  { "<Right>",          ":vertical resize +5<cr>",                   desc = "Resize Right" },
  { "<Left>",           ":vertical resize -5<cr>",                   desc = "Resize Left" },

  { "<leader><leader>", "<C-^>",                                     desc = "Alternate file" },
  { "<leader>1",        ":bprev<cr>",                                desc = "Prev buffer" },
  { "<leader>2",        ":bnext<cr>",                                desc = "Next buffer" },
  { "<leader>k",        ":Neotree filesystem<cr>",                   desc = "Focus file within tree" },
  { "<leader>e",        ":noh<cr>",                                  desc = "Clear Selection" },
  { "<leader>m",        ":Telescope oldfiles<cr>",                   desc = "T Oldfiles" },
  { "<leader>s",        ":Telescope git_status<cr>",                 desc = "T status" },
  { "<leader>f",        ":Telescope live_grep<cr>",                  desc = "T Grep" },
  { "<leader>w",        ":Telescope grep_string<cr>",                desc = "Telescope Grep cursor" },

  { "<leader>gs",       ":Gedit :<cr>",                              desc = "Status" },
  { "<leader>gd",       ":vertical Git diff %<cr>",                  desc = "Diff" },
  { "<leader>gl",       ":0GcLog<cr>",                               desc = "Log" },
  { "<leader>gb",       ":vertical Git blame<cr>",                   desc = "BLAME!" },

  { "<leader>tt",       ":GitGutterLineHighlightsToggle<cr>",        desc = "Gutter Toggle" },
  { "<leader>tx",       ":GitGutterUndoHunk<cr>",                    desc = "Gutter Undo Hunk" },
  { "<leader>tb",       ":GitBlameToggle<cr>",                       desc = "Blame Toggle" },
  { "<leader>to",       ":GitBlameOpenCommitURL<cr>",                desc = "Blame Open URL" },

  { "<leader>c<space>", "<Plug>CommentaryLine",                      desc = "Comment out" },
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

    local wk = require 'which-key'
    wk.add(which_key_mappings)
  end
}
