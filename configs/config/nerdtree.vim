" ----------------------------------------------------------------------------
"  NERDTREE
" ----------------------------------------------------------------------------
" Auto-open NERDTree when no file is passed
autocmd VimEnter * if argc() == 0 | NERDTree | wincmd p | endif

" Show hidden files
let NERDTreeShowHidden=1

" Auto-close vim if the only window left is NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1
      \ && exists('b:NERDTree') && b:NERDTree.isTabTree()
      \ | quit | endif

" NERDTree mappings
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>y :NERDTreeFocus<CR>
nnoremap <leader>rr :NERDTreeRefreshRoot<CR>
