return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@class PluginLspOpts
      diagnostics = {
        virtual_text = false,
      },
      document_highlight = {
        enabled = false,
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
      -- Hit Ctrl-g in grep to grep through results
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
      lsp = {
        jump1 = true,
        includeDeclaration = true,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@module "conform"
      ---@type conform.setupOpts
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          typescript = { "eslint_d" },
          typescriptreact = { "eslint_d" },
          javascript = { "eslint_d" },
          jsonc = { "eslint_d" },
          html = { "prettier" },
          ["*"] = { "codespell" },
        },
      }
      return opts
    end,
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
