return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                    ________ ++     ________                ]],
      [[                   /VVVVVVVV\++++  /VVVVVVVV\               ]],
      [[                   \VVVVVVVV/++++++\VVVVVVVV/               ]],
      [[                    |VVVVVV|++++++++/VVVVV/'                ]],
      [[                    |VVVVVV|++++++/VVVVV/'                  ]],
      [[                   +|VVVVVV|++++/VVVVV/'+                   ]],
      [[                 +++|VVVVVV|++/VVVVV/'+++++                 ]],
      [[               +++++|VVVVVV|/VVVVV/'+++++++++               ]],
      [[                 +++|VVVVVVVVVVV/'+++++++++                 ]],
      [[                   +|VVVVVVVVV/'+++++++++                   ]],
      [[                    |VVVVVVV/'+++++++++                     ]],
      [[                    |VVVVV/'+++++++++                       ]],
      [[                    |VVV/'+++++++++                         ]],
      [[                    'V/'   ++++++                           ]],
      [[                             ++                             ]],
      [[                                                            ]],
      [[                                                            ]],
      [[      [chore, docs, feat, fix, refactor, style, test]       ]],
    }
    dashboard.section.buttons.val = {
      --#region
      -- keys = {
      --   { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      --   { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      --   { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      --   { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      --   { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      --   { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      --   { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      --   { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      -- },
      dashboard.button("e", "New", ":ene <BAR> startinsert <CR>"),
      --dashboard.button("f", "Find", ":cd $HOME/dev | Telescope find_files<CR>"),
      --dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
      --dashboard.button("s", "Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button("q", "Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
