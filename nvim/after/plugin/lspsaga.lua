local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

-- change the lsp symbol kind
local kind = require('lspsaga.lspkind')
-- kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

saga.init_lsp_saga({
  max_preview_lines = 20,
  finder_action_keys = {
    -- quit = '<ESC>', -- close window with escape
    -- exec = '<CR>'
  },
  code_action_keys = {
    -- quit = "q",
    -- exec = "<CR>",
  },
  code_action_lightbulb = {
    enable = false,
    sign = false,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = true,
  },
})
-- saga.init_lsp_saga {
--   -- use_saga_diagnostic_sign = true,
--   error_sign = '',
--   -- warn_sign = '',
--   -- hint_sign = '',
--   -- infor_sign = '',
--   -- diagnostic_header_icon = '   ',
--   -- code_action_icon = ' ',
--   -- code_action_prompt = {
--   --   enable = true,
--   --   sign = true,
--   --   sign_priority = 20,
--   --   virtual_text = true,
--   -- },
--   -- finder_definition_icon = '  ',
--   -- finder_reference_icon = '  ',
--   -- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
--   finder_action_keys = {
--     open = '<CR>',
--     vsplit = 's',
--     split = 'i',
--     quit = '<ESC>',
--     scroll_down = '<C-f>',
--     scroll_up = '<C-b>' -- quit can be a table
--   },
--   rename_action_keys = {
--     quit = '<ESC>',
--     exec = '<CR>'  -- quit can be a table
--   },
--   -- definition_preview_icon = '  '
--   -- "single" "double" "round" "plus"
--   -- border_style = "single"
--   -- rename_prompt_prefix = '➤',
--   -- if you don't use nvim-lspconfig you must pass your server name and
--   -- the related filetypes into this table
--   -- like server_filetype_map = {metals = {'sbt', 'scala'}}
--   -- server_filetype_map = {}
-- }

-- nnoremap <silent> gh :Lspsaga lsp_finder<cr>
-- nnoremap <silent> gd :Lspsaga lsp_finder<cr>
-- nnoremap <silent> gr :Lspsaga lsp_finder<cr>
-- nnoremap <silent><leader>ac :Lspsaga code_action<cr>
-- nnoremap <silent>K :Lspsaga hover_doc<cr>
-- nnoremap <silent><C-k> <cmd>Lspsaga signature_help<cr>
-- nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
-- nnoremap <silent><leader>rn :Lspsaga rename<CR>

