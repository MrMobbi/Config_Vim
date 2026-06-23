" ----------------------------------------------------------------------------
" GENERAL MAPPINGS
" ----------------------------------------------------------------------------
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>s  :source %<CR>

" Colorcolumn toggles
nnoremap <leader>cc  :set colorcolumn=80<CR>
nnoremap <leader>ncc :set colorcolumn-=80<CR>

" Usefull remaping
nnoremap <S-l> $
nnoremap <S-H> ^
nnoremap <S-j> G
nnoremap <S-k> gg

vnoremap <S-l> $
vnoremap <S-H> ^
vnoremap <S-j> G
vnoremap <S-k> gg

" Uppercase or Lowercase a word in normal mode
nnoremap <leader>U viwUe
nnoremap <leader>u viwue

" Move one up or down
nnoremap - :m +1<CR>
nnoremap _ :m -2<CR>
vnoremap - :m +1<CR>
vnoremap _ :m -2<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vimrc tricks
nnoremap <leader>ev :sp $MYVIMRC<CR>
nnoremap <Up> :echo "No Up anymore"<CR>
nnoremap <Down> :echo "No Down anymore"<CR>
nnoremap <Left> :echo "No Left anymore"<CR>
nnoremap <Right> :echo "No Right anymore"<CR>

" Insersion mapings
inoremap jk <esc>

" Selection mapings
onoremap p i(
onoremap q i"
onoremap s i{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

vnoremap <leader>" c"<C-r>""<Esc>
