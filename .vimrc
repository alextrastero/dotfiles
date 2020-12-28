source ~/.vim/.mappings.vim
source ~/.vim/.plugins.vim

language en_US

" Encoding
set encoding=utf-8

" Theme
" *************************************

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
set t_Co=256
silent! colo gruvbox

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags='li\|p'

" Unsorted
" *************************************

" Don't try to be vi compatible
set nocompatible

" More natural split opening
set splitbelow
set splitright

" Indentation
set smarttab
set cindent
set expandtab

" Indent using two spaces.
set softtabstop=2
set tabstop=2
set shiftwidth=2

" dont wrap lines
set nowrap

" remove ESC delay
set timeoutlen=1000 ttimeoutlen=0

" line numbers
set number

" faster VIM
set lazyredraw
set ttyfast
set synmaxcol=500

" Searching
set hlsearch
set incsearch
set ignorecase

" Visualize tabs and newlines
set list
"set listchars=tab:……
set listchars=tab:XXX

" Show command completitions
set wildmenu

" don't add extra space after ., !, etc. when joining
set nojoinspaces

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" use backspace to delete
set backspace=indent,eol,start

" UpdateMru
augroup custom_filemru
  autocmd!
    autocmd BufWinEnter * UpdateMru
augroup END

let g:fzf_filemru_git_ls = 1
let g:fzf_filemru_ignore_submodule = 1
" Disable preview window
let g:fzf_preview_window = ''

" Allow hidden buffers
set hidden
set cmdheight=2
set shortmess=aFc

" Status bar
set laststatus=0

" Always show tabline
set showtabline=2

" fixing typescript indentation
"setlocal indentkeys+=0
let g:typescript_indent_disable = 1

" Webpack to ignore swap files
set dir=$HOME/.vim_tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" Fixes CRA updating bug
set backupcopy=yes

" COC VIM Config
" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=no " set to no
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-n> to trigger completion.
inoremap <silent><expr> <C-n> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"Note: for React to work as expected, you need your JSX filetype to be
"javascript.jsx and your TSX filetype to be typescript.jsx or typescript.tsx.
"In coc.nvim, these filetypes are mapped to javascriptreact and typescriptreact
"because that's what tsserver uses.

augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.hbs set filetype=html
augroup END

hi link CocErrorHighlight SpellBad
" hi link CocWarningHighlight DiffText
" hi link CocInfoHighlight DiffText
" hi link typescriptCommentTodo DiffDelete
" hi link CocErrorSign DiffDelete

" Add space after comment
let NERDSpaceDelims=1

" Turn off swapfiles
set noswapfile
set nobackup
set nowb

" Indentation
let g:indentLine_char = '|'
let g:indentLine_setColors = 1

" buftabline config
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
let g:buftabline_plug_max = 0

" improve COC update rate TRYING
set updatetime=300

set colorcolumn=100

" git gutter
let g:gitgutter_max_signs = 50
set signcolumn=yes

function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

nmap <Space> :call GitGutterNextHunkCycle()<CR>

" vim-jsx-pretty config
let g:vim_jsx_pretty_colorful_config = 1 " colorful config flag
let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'typescript.tsx', 'tsx']

