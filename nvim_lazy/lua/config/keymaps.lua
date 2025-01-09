-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- TmuxNavigate
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", {})

vim.keymap.set("n", "<leader>e", "<cmd>noh<CR>", {})

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {})
vim.keymap.set("n", "qq", "<cmd>bd<CR>", {})
vim.keymap.set("n", "<C-d>", "<cmd>bd<CR>", {})

vim.keymap.set("n", ";", ":", {})

-- FORMATTING
local format = function()
  Util.format({ force = true })
end
vim.keymap.set("n", "<C-f>", format, {})

vim.keymap.set("n", "<space>", "<cmd>bn<cr>", {})

vim.keymap.set("n", "<C-p>", "<cmd>FzfLua files<cr>", {}) -- TODO why cant this behave like <leader><space>
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua oldfiles<cr>", {})
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<cr>")

-- dont auto jump
vim.cmd([[
  nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
]])

-- SETUP recent to leader m

-- next hunk mapping
-- remove indent line
-- bring back surround
-- remove that fancy commandline placement
-- dont highlight other words when hovering
-- show buffers always ?
-- disable mini.surround and copy over surround from old config
-- dont highlight line
-- add mapping for: leader c space comment line
-- which key placement
-- TODO s not working?
-- grep for word under cursor
