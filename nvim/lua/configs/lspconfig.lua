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
  client.resolved_capabilities.document_formatting = false

  -- disable diagnostic on virtual text
  -- vim.diagnostic.config({ virtual_text = false })

  -- show diagnostic on hover
  -- You will likely want to reduce updatetime which affects CursorHold
  -- note: this setting is global and should be set only once
  vim.o.updatetime = 550

  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_cursor_diagnostics({focusable=false, border='rounded'})]]
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]]

  -- show references on hover INSTEAD!
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --       augroup lsp_document_highlight
  --         autocmd! * <buffer>
  --         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --       augroup END
  --     ]],
  --     false
  --   )
  -- end
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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
      quotePreference = "single",
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
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
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
