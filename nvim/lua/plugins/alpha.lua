return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

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
      dashboard.button("e", "New", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "Find", ":cd $HOME/dev | Telescope find_files<CR>"),
      dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button("q", "Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end
}
