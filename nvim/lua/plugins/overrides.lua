return {
  {
    "neovim/nvim-lspconfig",
    -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- keys[#keys + 1] = { "K", false }
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      document_highlight = {
        enabled = false,
      },
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
      setup = {
        eslint = function()
          LazyVim.format.register(LazyVim.lsp.formatter({
            name = "eslint: lsp",
            primary = false,
            priority = 200,
            filter = "eslint",
          }))
        end,
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
      words = {
        enabled = false,
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      oldfiles = {
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      return {
        formatters_by_ft = {
          lua = { "stylua" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          javascript = { "prettier" },
          jsonc = { "prettier" },
        },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      -- TODO remove from complition when in commandline
      completion = {
        -- https://cmp.saghen.dev/configuration/completion#list
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        documentation = {
          window = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
        menu = {
          border = "rounded",
          draw = { gap = 2 },
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine: BlinkCmpMenuSelection,Search:None",
        },
      },
      keymap = {
        -- https://cmp.saghen.dev/configuration/keymap#super-tab
        preset = "enter",
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
    opts_extend = { "sources.default" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
      },
    },
  },
}
