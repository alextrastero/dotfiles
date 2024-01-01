return {
  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      local lspsaga = require 'lspsaga'
      lspsaga.setup({
        preview = {
          lines_above = 2,
          lines_below = 10,
        },
        scroll_preview = {
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        request_timeout = 2000,
        lightbulb = {
          enable = false,
        },
        definition = {
          width = 1,
          height = 1,
        },
        implement = {
          virtual_text = false,
        },
        finder = {
          layout = "normal",
        },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require 'lspconfig'
      local util = nvim_lsp.util;
      -- local on_attach = function(client, bufnr)
      local on_attach = function(client)
        -- function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        -- function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        client.server_capabilities.documentFormattingProvider = false -- neovim V0.8
      end

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


      -- tsserver
      nvim_lsp['tsserver'].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = init_options,
        root_dir = util.find_git_ancestor,
      }
      nvim_lsp['stylelint_lsp'].setup({
        filetypes = { "css" },
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
}
