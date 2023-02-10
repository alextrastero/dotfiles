local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- tsserver specifics
  -- NOTE these 3 lines dont allow to save file in VIM
  --if client.config.flags then
    --client.config.flags.allow_incremental_sync = true
  --end
  --
  -- client.client_capabilities.document_formatting = false -- neovim V0.7
  client.server_capabilities.documentFormattingProvider = false -- neovim V0.8
  vim.o.updatetime = 550
end

-- workaround
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, 'react/index.d.ts') == nil
end
-- end workaround

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- https://github.com/typescript-language-server/typescript-language-server#initializationoptions
nvim_lsp['tsserver'].setup {
  on_attach = on_attach,
  -- capabilities = capabilities,
  handlers = {
    ['textDocument/definition'] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
      end

      vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
    end
  },
  init_options = {
    hostInfo = "neovim",
    preferences = {
      importModuleSpecifierPreference = "relative",
      indentSize = 2,
      includeCompletionsForImportStatements = true,
      useAliasForRenames = false,
      completions = {
        completeFunctionCalls = true
      }
    }
  }
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

nvim_lsp['efm'].setup {
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.goto_definition = false
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
