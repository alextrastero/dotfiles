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

" convert selection to snake case
xnoremap <C-s> :CamelToSnakeSel!<cr>

" paste in insert mode
inoremap <c-p> <c-r>*

" TODO move this
function! s:Camelize(range) abort
  if a:range == 0
    s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g
  else
    s#\%V\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)\%V#\u\1\2#g
  endif
endfunction

function! s:Snakeize(range) abort
  if a:range == 0
    s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
  else
    s#\%V\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)\%V#\l\1_\l\2#g
  endif
endfunction

command! -range CamelCase silent! call <SID>Camelize(<range>)
command! -range SnakeCase silent! call <SID>Snakeize(<range>)
