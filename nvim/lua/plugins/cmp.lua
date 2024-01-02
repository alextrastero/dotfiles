vim.opt.completeopt = "menuone,noselect"

local kind_icons = {
  Text = "",
  Method = "",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰫧",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- find more here: https://www.nerdfonts.com/cheat-sheet
return {
  {
    'L3MON4D3/LuaSnip',
    lazy = false,
    run = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip'
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    branch = 'main',
    opts = {
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
      }
    }
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = false,
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
              buffer = "[buf]",
              nvim_lsp = "[lsp]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
            })[entry.source.name]
            return vim_item
          end
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fb)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fb()
            end
          end,
        },
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
            -- { name = "nvim_lsp" },
            -- { name = "luasnip" },
          -- },
          -- {
            -- { name = "buffer" },
            -- { name = "nvim_lua" },
          }
        ),
      })
    end
  }
}
