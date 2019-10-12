" Kjelles vim configurations
" Set Values: {{{
"Set values
set tabstop    	=2
set shiftwidth 	=2
set showbreak 	=+++
set foldmethod  =marker
set cmdheight		=2
set t_Co				=256

"Toggles
set foldenable	"Enables folding 
set number 	    "Show line numbers
set cindent	    "Auto-indent new lines
set hlsearch	  "Highlights all search results
set showmatch	  "Highlights matching brackets
set noexpandtab


colorscheme deus
"}}}
"Custom commands: {{{
command! -nargs=1 ArduinoCompile :exe "!arduino-cli compile ~/Arduino/%< --verbose --fqbn arduino:avr:" . <args>
command! -nargs=1 ArduinoUpload :exe "!arduino-cli upload ~/Arduino/%< -p /dev/ttyACM0 --verbose --fqbn arduino:avr:" . <args>

"Will call the commands above:
"compile for a specific arduino board in arduino:avr familty
"and then upload it to /dev/ttyACM0
function! Arduino(arg)
	:silent :ArduinoCompile(a:arg)
	:ArduinoUpload(a:arg)
endfunction


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


"Bindings for easier working with Tabs (workspaces)
"Switching tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"Moving tabs
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

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
