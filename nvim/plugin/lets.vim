"vim-closetag
let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

"SirVer/ultisnips
let g:UltiSnipsSnippetDirectories = ["~/dev/dotfiles/vim/snips"]

"autoformat
"autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)

"GitGutter
let g:gitgutter_map_keys = 1
let g:gitgutter_signs = 1
