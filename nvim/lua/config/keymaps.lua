-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- TmuxNavigate
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", {})

vim.keymap.set("n", "<leader>e", "<cmd>noh<CR>", { desc = "which_key_ignore" })

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {})

-- BUFFER DELETE keeping current split layout
local bufdelete = function()
  Snacks.bufdelete()
end

vim.keymap.set("n", "qq", "<cmd>bd<cr>", {})
vim.keymap.set("n", "<C-d>", bufdelete, {})

vim.keymap.set("n", "qq", "<cmd>bd<cr>", {})

vim.keymap.set("n", ";", ":", {})

vim.keymap.set("n", "gt", "<cmd>Trouble diagnostics<CR>", {})

-- FORMATTING
local format = function()
  Util.format({ force = true })
end
vim.keymap.set("n", "<C-f>", format, {})

-- DIAGNOSTIC
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "gj", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "gk", diagnostic_goto(false), { desc = "Prev Diagnostic" })

vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<cr>", { desc = "Code actions" })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<cr>", { desc = "Rename" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" })

vim.keymap.set("n", "<space>", "<cmd>bn<cr>", {})
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineCyclePrev<cr>", { desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineCycleNext<cr>", { desc = "which_key_ignore" })

-- FzfLua mappings
vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<cr>", {}) -- TODO why cant this behave like <leader><space>
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua oldfiles<cr>", {})
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>FzfLua grep_cword<cr>", { desc = "Grep word under cursor " })
vim.keymap.set("n", "<tab>", "<cmd>FzfLua buffers<cr>", { desc = "buffers" })

-- vim-fugitive
vim.keymap.set("n", "<leader>gs", ":Gedit :<cr>", { desc = "Status" })
vim.keymap.set("n", "<leader>gd", ":vertical Git diff %<cr>", { desc = "Diff" })
vim.keymap.set("n", "<leader>gl", ":0GcLog<cr>", { desc = "Log" })
vim.keymap.set("n", "<leader>gb", ":vertical Git blame<cr>", { desc = "BLAME!" })

-- hunks
vim.keymap.set("n", "<leader>tx", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset Hunk" })
vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Blame Toggle" })

vim.keymap.set("n", "<leader>c<space>", "<cmd>normal gcc<cr>", { desc = "Comment current line" })

-- dont auto jump
vim.cmd([[
  nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
]])
