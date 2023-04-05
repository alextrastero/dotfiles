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

local init_options = {
  preferences = {
    importModuleSpecifierPreference = "auto",
    indentSize = 2,
    includeCompletionsForImportStatements = true,
    useAliasForRenames = false,
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

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

vim.diagnostic.config({
  virtual_text = false, -- disable inline errors
})

nvim_lsp['efm'].setup {
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.goto_definition = false
    -- show errors on hover
    -- vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, {focus=false})')
    -- vim.api.nvim_command('autocmd CursorHold <buffer> Lspsaga show_cursor_diagnostics')
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  }
}

-- lua lsp
nvim_lsp['lua_ls'].setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})
