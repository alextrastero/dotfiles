nnoremap ; :
nnoremap <leader>r :so $MYVIMRC<cr>
nnoremap qq :bd<cr>
nnoremap <leader>e :noh<cr>

" NvimTree
nnoremap <leader>\ :NvimTreeFindFile<cr>

" BufTabline
nnoremap <leader>1 :bprev<cr>
nnoremap <leader>2 :bnext<cr>

" fzf vim
nnoremap <tab> :Buffers<cr>
nnoremap <C-p> :Files<cr>

" no cleaner way... find but stay
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Resize splits
nnoremap <Up> :resize +5<cr>
nnoremap <Down> :resize -5<cr>
nnoremap <Right> :vertical resize +5<cr>
nnoremap <Left> :vertical resize -5<cr>

" camelize
nnoremap _ f_x~

vmap <C-c> :s#_\(\l\)#\u\1#g<cr>
