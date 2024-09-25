return {
  'neovim/nvim-lspconfig',
  lazy = false,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local lspconfig = require 'lspconfig'

    local init_options = {
      preferences = {
        importModuleSpecifierPreference = "auto",
        indentSize = 2,
        includeCompletionsForImportStatements = true,
        quotePreference = "single",
        completions = {
          completeFunctionCalls = true
        }
      }
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      init_options = init_options,
      root_dir = lspconfig.util.find_git_ancestor,
      settings = {
        diagnostics = {
          -- https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
          ignoredCodes = {
            95062,
            95065,
          }
        }
      }
    })

    lspconfig.stylelint_lsp.setup({
      filetypes = { "css" },
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    vim.diagnostic.config({
      virtual_text = false, -- disable inline errors
    })
  end
}
