"	### Set Utils ###"

let g:polyglot_disabled = ['markdown']

set number
set mouse=a
set noswapfile
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"	### File for info to the fancy starter ###"
set viminfo='100,n$HOME/.vim/files/info/viminfo

"	### Plugin ####"
call plug#begin()

"	### Fancing starting page ###"
	Plug 'mhinz/vim-startify'

"	### Conquer Of Completion ###"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

"	### NerdTree with icons ###"
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'

"	### Sercher for files ###"
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

" 	### Color scheme and vim airline ###"
	Plug 'jonathanfilip/vim-lucius'
	Plug 'junegunn/seoul256.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'flazz/vim-colorschemes'

"	### Syntax color for different texts ###
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'

"	### Header 42 ###"
	Plug 'pbondoer/vim-42header'

"	### Geter for git to vim ###"
	Plug 'tpope/vim-fugitive'
call plug#end()

"	### Vim-theme ###"
if has('termguicolors')
	set termguicolors
endif

let g:seoul256_light_background = 253
colorscheme seoul256-light

"	### Bookmakrs for fancy starter ###"
let g:startify_bookmarks = [
		\ { 'z' : '~/.zshrc' },
		\ { 'v' : '~/.vimrc' },
		\ ]

"	### Lister for fancy starter ###"
function! s:list_commits()
	let git = 'git -C ~/repo'
	let commits = systemlist(git .'log --oneline | head -n10')
	let git = 'G'. git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_list = [
		\ { 'header': ['	Bookmarks'],		'type': 'bookmarks' },
		\ { 'header': ['	MRU'],				'type': 'files' },
		\ { 'header': ['	MRU'. getcwd()],	'type': 'dir' },
		\ { 'header': ['	Commits'], 			'type': function('s:list_commits') },
		\ ]

"	#### Vim-airline ###"
set ttimeoutlen=50
let g:airline_theme='tomorrow'
let g:airline#extensions#branch#enabled=1

"	### UserLog for header ###"
let g:user42 = 'mjulliat'
let g:mail42 = 'mjulliat@student.42.ch'

"	### Space bar as <leader> ###"
nnoremap <SPACE> <Nop>
let	mapleader=" "

"	### auto start nerdtree ###"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"	### auto close nerdtree ###"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"	### Maping of the navigation folder ###"
nnoremap <leader>id :IndentGuidesToggle<CR>

"	### Maping of the navigation folder ###"
nnoremap <leader>pv :Ex<CR>

"	### maping of nerdtree ###"
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>

nnoremap <leader>cc :set colorcolumn=80<cr>
nnoremap <leader>ncc :set colorcolumn-=80<cr>

"	### Devicone seting ####"
set encoding=UTF-8

"	### maping of fzf ###"
nnoremap <leader>ff :FZF<CR>

"	### Conquer Of Completion ###"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
	set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

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
  \ 'coc-docker',
  \ 'coc-pyright',
  \ ]

nnoremap <leader>cm :CocList<CR>
nnoremap <leader>ff :FZF<CR>
