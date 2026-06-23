
" ----------------------------------------------------------------------------
" 12) COC (Conquer of Completion)
" ----------------------------------------------------------------------------
set nobackup
set nowritebackup
set cmdheight=2

" Completion behavior
set completeopt-=preview
augroup coc
autocmd!
autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave  * if pumvisible() == 0 | pclose | endif

" Highlight symbol references on hold
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Enter confirms selection in Coc menu
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" K shows hover documentation
nnoremap <C-d> :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-sh',
      \ 'coc-docker',
      \ 'coc-pyright',
      \ 'coc-terraform',
      \ 'coc-yaml',
      \ 'coc-lua',
      \ 'coc-solargraph',
      \ ]

nnoremap <leader>cm :CocList<CR>
