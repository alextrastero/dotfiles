"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" leader + r - reload config and airline
nmap <Leader>r :so $MYVIMRC<cr>:AirlineRefresh<cr>:echo "Updated"<cr>

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
" nnoremap <Leader>d :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Resize splits
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <Leader>\ :NERDTreeFind<CR>
nnoremap <F2> :lopen<CR>
nnoremap <F3> :lclose<CR>

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

" Navigate throu git hunks
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

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

"https://github.com/sickill/vim-pasta
nnoremap <leader>p p`[v`]=

" Search and Replace
nmap <Leader>f :%s//g<Left><Left>

"deoplete CR
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
  "return deoplete#close_popup() . "\<CR>"
"endfunction

" Fix myjs
" noremap <Leader>f :PrettierAsync<CR>

" replace selected text
vnoremap <Leader>d "hy:%s/<C-r>h//gc<left><left><left>

" multiple cursor hack
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
