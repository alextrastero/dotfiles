"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" leader + r - reload config and airline
nmap <Leader>r :so $MYVIMRC<cr>:AirlineRefresh<cr>:IndentLinesEnable<cr>:echo "Updated"<cr>

"jump to other tag
nnoremap <leader>5 :MtaJumpToOtherTag<cr>

"move around tabs
"search for vis1al selected
vnoremap // y/<C-R>"<CR>

"sort
vnoremap ,, :sort<CR>

" Indent entire file
map <F7> mzgg=G`z

" Remap search to search and don't go to next result
nnoremap <Leader>d :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Resize splits
nnoremap <silent> <Leader>] :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize +5"<CR>

" Toggle numbrs
nmap <leader>n :set invnumber<CR>

" Fast saving
nmap <leader>w :w!<cr>
" Better ESC key
"imap kj <ESC>

nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>
nmap <leader>9 :bn<cr>

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
nnoremap <Leader>\ :NERDTreeFind<CR>
nnoremap <F2> :lopen<CR>
nnoremap <F3> :lclose<CR>

" Hackatron
nmap ; :

" qq to delete buffer
nmap qq :bd<cr>

" Paste in insert mode
set pastetoggle=<F10>
imap <C-V> <F10><C-r>"<F10>

" Remap ctrl-f to Ack
nmap <C-F> :Ack<space>

" Navigate throu git hunks
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
