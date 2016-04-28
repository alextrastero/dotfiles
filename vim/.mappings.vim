"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" leader + r - reload config and airline
nmap <Leader>r :so $MYVIMRC<cr>:AirlineRefresh<cr>:IndentLinesEnable<cr>:echo "Updated"<cr>

" Fast saving
nmap <leader>w :w!<cr>
" Better ESC key
imap kj <ESC>

nmap <leader>1 :bp<Return>
nmap <leader>2 :bn<Return>

" Fast saving
nmap <leader>w :w!<cr>
noremap <Leader>e :noh<CR>
noremap <C-e> :noh<cr>

nnoremap <Tab> :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap <Tab> <C-n>

nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :lopen<CR>
nnoremap <F3> :lclose<CR>

" Hackatron
nmap ; :

" CMD 1 takes you to first buffer and CMD 9 to last
nmap <D-1> :bfirst<cr>
nmap <D-9> :blast<cr>

" qq to delete buffer
nmap qq :bd<cr>
