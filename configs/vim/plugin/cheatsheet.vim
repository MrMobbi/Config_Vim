function! CheatSheet()
      let g:cheatsheet_prev_win = win_getid()
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
      \ '<leader>ev   Open ~/.vimrc',
      \ '',
      \ '🔍 SEARCH / FZF',
      \ '<leader>ff   Find files',
      \ '<leader>rg   Ripgrep search',
      \ '<leader>rw   Search word under cursor',
      \ '',
      \ '🎨 UI / VISUAL',
      \ '<leader>cc   Colorcolumn 80',
      \ '<leader>ncc  Remove colorcolumn',
      \ '',
      \ '📑 BUFFERS',
      \ '<leader><Tab> Next buffer',
      \ '<leader>bp    Previous buffer',
      \ '<leader>bd    Delete buffer',
      \ '<leader>bb    List buffers',
      \ '<leader>1-9   Jump buffer',
      \ '',
      \ '✏️ EDITING',
      \ '<leader>u    lowercase word',
      \ '<leader>U    UPPERCASE word',
      \ '-            move line down',
      \ '_            move line up',
      \ 'jk           exit insert mode',
      \ '',
      \ '🧠 COC',
      \ 'Ctrl-d       Hover documentation',
      \ '<leader>cm   CocList',
      \ 'Enter        Confirm completion',
      \ '',
      \ '🤖 CODEIUM',
      \ 'Ctrl-j       Accept suggestion',
      \ '<leader>ce   Enable Codeium',
      \ '<leader>cd   Disable Codeium',
      \ '',
      \ '🌿 GIT',
      \ '<leader>ga   Git add .',
      \ '<leader>gb   Git blame line',
      \ '',
      \ '🔌 PLUGINS',
      \ '<leader>st   Startify',
      \ '<leader>po   Rainbow toggle',
      \ '',
      \ '⚙️ GENERAL',
      \ '<leader>s    Source current file',
      \ '<leader>cs   Open cheatsheet',
      \ ':noh         Clear search highlight',
      \ ':%s/a/b/g    Replace all',
      \ '',
      \ '🖱️ AUTO',
      \ '- NERDTree auto opens',
      \ '- Auto close if only NERDTree',
      \ '- Rainbow parentheses enabled',
      \ '- Trim trailing whitespace on save',
      \ '',
      \ 'Press q to close'
      \ ])

      setlocal nomodifiable
      nnoremap <buffer> q :call CloseCheatSheet()<CR>
endfunction

function! CloseCheatSheet()
  close
  call win_gotoid(g:cheatsheet_prev_win)
endfunction

command! CheatSheet call CheatSheet()
