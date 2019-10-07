" Set Values: {{{
"Set values
set tabstop    	=2
set shiftwidth 	=2
set showbreak 	=+++
set foldmethod  =marker

"Toggles
set foldenable	"Enables folding 
set number 	    "Show line numbers
set cindent	    "Auto-indent new lines
set hlsearch	  "Highlights all search results
set showmatch	  "Highlights matching brackets
set noexpandtab

set t_Co=256
colorscheme deus
"}}}
"Keybindings: {{{
"Quit insert mode with ctrl + j
imap <C-j> <Esc>

" Enables folding with space
nnoremap <SPACE> za

" Inverse tabs
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
"}}}
" netrw configs: {{{
" netrw can be used instead of nerdtree
let g:netrw_liststyle     = 3
let g:netrw_banner        = 0
let g:netrw_browser_split = 1
let g:netrw_altv	  = 1
let g:netrw_winsize	  = 25
"}}}
"Plugins: {{{
call plug#begin('~/.vim/plugins')


call plug#end()
"}}}
