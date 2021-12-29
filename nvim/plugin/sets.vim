set guicursor=
set relativenumber
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set ignorecase
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmode
set showcmd
set signcolumn=yes
set isfname+=@-@
" set ls=0
set autoindent

set splitbelow
set splitright

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
set clipboard+=unnamedplus
" show the nasties
set list
set listchars=trail:·     " trailing spaces
set listchars+=tab:\ \    " tabs (don't show them)

" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js,*.ts set filetype=typescriptreact

" show diff in a vertical split
set diffopt+=vertical
