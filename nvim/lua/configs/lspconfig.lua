local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then
  return
end

-- local protocol = require('vim.lsp.protocol')
local util = nvim_lsp.util;

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  client.server_capabilities.documentFormattingProvider = false -- neovim V0.8
  vim.o.updatetime = 550
end

-- workaround
-- local function filter(arr, fn)
--   if type(arr) ~= "table" then
--     return arr
--   end

--   local filtered = {}
--   for k, v in pairs(arr) do
--     if fn(v, k, arr) then
--       table.insert(filtered, v)
--     end
--   end

--   return filtered
-- end

-- https://github.com/typescript-language-server/typescript-language-server/issues/216
-- local function filterReactDTS(value)
--   return string.match(value.uri, '%.d.ts') == nil
-- end

-- local function filterReactDTS(value)
--   return string.match(value.uri, 'react/index.d.ts') == nil
-- end
-- end workaround

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local init_options = {
  preferences = {
    importModuleSpecifierPreference = "auto",
    indentSize = 2,
    includeCompletionsForImportStatements = true,
    -- useAliasForRenames = false,
    quotePreference = "single",
    completions = {
      completeFunctionCalls = true
    }
  }
}

nvim_lsp['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = init_options,
  root_dir = util.find_git_ancestor,
}

-- requires npm package eslint_d
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
local signs = {
  DiagnosticSignError = '',
  DiagnosticSignHint = '',
  DiagnosticSignInfo = '',
  DiagnosticSignWarn = '',
  LightBulbSign = ''
}

for type, icon in pairs(signs) do
  vim.fn.sign_define(type, { text = icon, texthl = type, linehl = type, numhl = type })
end

vim.diagnostic.config({
  virtual_text = false, -- disable inline errors
  -- virtual_text = {
  --   severity = vim.diagnostic.severity.ERROR,
  -- }
})

-- nvim_lsp['efm'].setup {
--   on_attach = function(client)
--     client.server_capabilities.document_formatting = true
--     client.server_capabilities.goto_definition = false
--   end,
--   settings = {
--     languages = {
--       javascript = {eslint},
--       javascriptreact = {eslint},
--       ["javascript.jsx"] = {eslint},
--       typescript = {eslint},
--       ["typescript.tsx"] = {eslint},
--       typescriptreact = {eslint}
--     }
--   },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx"
--   }
-- }

-- lua lsp
require'lspconfig'.lua_ls.setup {}
-- require'lspconfig'.lua_ls.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- emmet
-- nvim_lsp['emmet_ls'].setup({
--   capabilities = capabilities,
--   filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   },
--   mapping = cmp_nvim_lsp
-- })


-- stylelint
nvim_lsp['stylelint_lsp'].setup({
  filetypes = { "css" },
})
