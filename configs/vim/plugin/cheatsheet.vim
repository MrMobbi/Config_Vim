function! CheatSheet()
  botright 20new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal nobuflisted
  setlocal nonumber norelativenumber signcolumn=no

  call setline(1, [
        \ '=== 🧠 VIM CHEATSHEET ===',
        \ '',
        \ 'Leader: SPACE',
        \ '',
        \ '📂 FILE / NAVIGATION',
        \ '<leader>pv   :Ex',
        \ '<leader>t    NERDTreeToggle',
        \ '<leader>f    NERDTreeFind',
        \ '<leader>y    NERDTreeFocus',
        \ '<leader>rr   NERDTreeRefreshRoot',
        \ '',
        \ '🔍 SEARCH / FZF',
        \ '<leader>ff   FZF List files',
        \ '<leader>rg   Rg List buffer in the current directory',
        \ '<leader>rw   word under cursor',
        \ '<leader>rs   visual selection search',
        \ '',
        \ '🎨 UI / VISUAL',
        \ '<leader>cc   colorcolumn=80',
        \ '<leader>ncc  remove colorcolumn',
        \ '',
        \ '🔌 PLUGINS',
        \ '<leader>st   Startify',
        \ '<leader>po   Rainbow toggle',
        \ '',
        \ '🧠 COC',
        \ 'shift+k      hover documentation',
        \ '<leader>cm   CocList',
        \ 'Enter        confirm completion',
        \ 'Ctrl + n     next completion',
        \ 'Ctrl + p     previous completion',
        \ '',
        \ '🌿 GIT',
        \ '<leader>ga   Git add .',
        \ '',
        \ '⚙️ GENERAL + UTILS',
        \ '<leader>s    source current file',
        \ ':noh         remove highligth',
        \ ':%s/a/b      replace all a ->  b',
        \ '',
        \ '🖱️ AUTO',
        \ '- NERDTree auto opens',
        \ '- Auto close if only NERDTree',
        \ '- Rainbow parentheses enabled',
        \ '',
        \ 'Press q to close'
        \ ])

  setlocal nomodifiable
  nnoremap <buffer> q :close<CR>
endfunction

command! CheatSheet call CheatSheet()
