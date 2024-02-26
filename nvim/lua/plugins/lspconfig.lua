return {
  'neovim/nvim-lspconfig',
  lazy = false,
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

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      init_options = init_options,
      root_dir = lspconfig.util.find_git_ancestor,
    })

    lspconfig.stylelint_lsp.setup({
      filetypes = { "css" },
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

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
    })
  end
}
