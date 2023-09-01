"SirVer/ultisnips
let g:UltiSnipsSnippetDirectories = ["../snips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"GitGutter
let g:gitgutter_map_keys = 1
let g:gitgutter_signs = 1
let g:gitgutter_set_sign_backgrounds = 1

let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'

let g:sneak#label = 1
let g:sneak#s_next = 1

"neoformat
let g:neoformat_enabled_python = ['stylelint']

nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"git blame
" Available options: <author>, <committer>, <date>, <committer-date>, <summary>, <sha>
let g:gitblame_message_template = '<summary> • <date> • <author>'
let g:gitblame_display_virtual_text = 0
let g:gitblame_delay = 1000 " 1 second
let g:gitblame_highlight_group = "Question"
