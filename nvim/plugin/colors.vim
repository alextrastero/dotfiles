set background=dark
colorscheme gruvbox

" fancy line number color
hi clear CursorLineNR
hi CursorLine guibg=NONE guifg=NONE
hi link CursorLineNR Question
set cursorline

" remove gutter bg color
" hi SignColumn guibg=NONE

" color lsp signs
" hi link DiagnosticSignError DiagnosticError
" hi link DiagnosticSignInfo DiagnosticInfo
" hi link DiagnosticSignHint DiagnosticHint

" color lsp highlights
hi link LspReferenceText Visual
hi link LspReferenceRead Visual
hi link LspReferenceWrite Visual

" Tweak comment
hi Comment gui=italic

hi link NvimTreeFolderName Conceal
hi link NvimTreeFolderIcon Conceal
hi link NvimTreeEmptyFolderName Conceal
hi link NvimTreeOpenedFolderName Conceal
hi link NvimTreeOpenedFile Conceal
