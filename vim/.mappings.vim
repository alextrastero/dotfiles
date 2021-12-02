"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" leader + r - reload config and airline
nmap <Leader>r :so $MYVIMRC<cr>:echo "Updated"<cr>

"search for vis1al selected
vnoremap // y/<C-R>"<CR>

"sort visual selected lines
vnoremap ,, :sort<CR>

" Remap search to search and don't go to next result
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Resize splits
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Right>  :vertical resize +5<CR>
nnoremap <Left> :vertical resize -5<CR>

" Toggle numbrs
" nmap <leader>n :set invnumber<CR>
" Repalce Toggle numbers with relative number
nmap <leader>n :set relativenumber!<CR>

" Fast saving
noremap <Leader>e :noh<CR>

" Show open buffer in Nerdtree
nnoremap <Leader>\ :NERDTreeFind<CR>

" USING CTRLP
nnoremap <Tab> :Buffers<cr>
nnoremap <Leader>m :History<cr>
nnoremap <C-p> :Files<cr>
" or :GFiles

" Hackatron
nmap ; :

" qq to delete buffer
nmap qq :bd<cr>

" Paste in insert mode
set pastetoggle=<F10>
imap <C-V> <F10><C-r>"<F10>

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

nmap <C-f> :Ag 

nmap <Leader>l :CocList diagnostics<cr>

nmap <leader>1 :bprev<cr>
nmap <leader>2 :bnext<cr>

let g:buftabline_indicators=1
let g:buftabline_separators=1
let g:buftabline_plug_max=0

" search for entire word
" nmap <Leader>/ :\<\><Left><Left>
nmap <Leader>/ :/\<\><Left><Left>
