
" Trim whitsapce when a file is saved
function! TrimWhitespace()
  if &modifiable && !&binary
    let view = winsaveview()

    " Remove trailing whitespace
    silent! %s/\s\+$//e

    " Remove empty lines at end of file
    while line('$') > 1 && getline(line('$')) =~# '^\s*$'
      execute '$delete'
    endwhile

    call winrestview(view)
  endif
endfunction

" Trim whitespace
augroup TrimWhitespace
  autocmd!
  autocmd BufWritePre * call TrimWhitespace()
augroup END

" Write the file when a new file is created
augroup auto_write
  autocmd!
  autocmd BufNewFile * :write
augroup END

" Snippet for commenting
augroup comment
  autocmd!
  autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
  autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
augroup END

function! ToggleRelativeNumber()
  if &relativenumber
    set norelativenumber
    echo "Relative numbers OFF"
  else
    set relativenumber
    echo "Relative numbers ON"
  endif
endfunction

nnoremap <leader>rn :call ToggleRelativeNumber()<CR>
