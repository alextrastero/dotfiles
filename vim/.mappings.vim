"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" leader + r - reload config and airline
nmap <Leader>r :so $MYVIMRC<cr>:echo "Updated"<cr>

"move around tabs
"search for vis1al selected
vnoremap // y/<C-R>"<CR>

"sort visual selected lines
vnoremap ,, :sort<CR>

" Remap search to search and don't go to next result
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Resize splits
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Left>  :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>

" OMNI mappings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Toggle numbrs
nmap <leader>n :set invnumber<CR>

nmap <leader>1 :bp<cr>
nmap <leader>2 :bn<cr>
nmap <leader>9 :bn<cr>

" Fast saving
nmap <leader>w :w!<cr>
noremap <Leader>e :noh<CR>
noremap <C-e> :noh<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show open buffer in NERDTree
nnoremap <Leader>\ :NERDTreeFind<CR>

nnoremap <Tab> :CtrlPBuffer<cr>
nnoremap <Leader>m :CtrlPMRU<cr>

" Hackatron
nmap ; :

" qq to delete buffer
nmap qq :bd<cr>

" Paste in insert mode
set pastetoggle=<F10>
imap <C-V> <F10><C-r>"<F10>

" Remap ctrl-f to Ag
nmap <C-F> :Ag<space>
nnoremap \ :Ag<SPACE>

" search in buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

inoremap <tab> <c-n>

" Search and Replace
nmap <Leader>f :%s//g<Left><Left>

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
