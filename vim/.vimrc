""""""""""""""""""""""""""
" Boolean options 
""""""""""""""""""""""""""
set relativenumber "Show relative line numbers
set expandtab
set autoindent
set showmatch

""""""""""""""""""""""""""
" Value options 
""""""""""""""""""""""""""
set so					=100 "Center cursor 100 lines
set tabstop			=2
set shiftwidth	=2

""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""
" Disable arrow keys to break bad habit (happy now Martin c: )
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <esc> <nop>

" Avoid overriding default keybinds
let mapleader = ","

" Edit .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>

" Exit to normal mode
vnoremap <leader>l <esc>
inoremap <leader>l <esc>

" A more logical indentation mapping
nnoremap <leader><Tab> >>
nnoremap <leader><S-Tab> <<
vnoremap <leader><Tab> >gv
vnoremap <leader><S-Tab> <gv

" Move line downwards
nnoremap <leader>a ddp
inoremap <leader>a <esc>ddpi
vnoremap <leader>a <esc>ddpv
" Move line upwards
nnoremap <leader>w ddkkp
inoremap <leader>w <esc>ddkkpi
vnoremap <leader>w <esc>ddkkpv

" Uppercase current word
nnoremap <leader>u viwU
vnoremap <leader>u iwU
noremap <leader>u <esc>viwU

" Delete line
nnoremap <leader>x dd
inoremap <leader>x ddi
vnoremap <leader>x <esc>ddv

" Add matching token
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>bi{<esc>lel

" Go to beginning of line and end of line
nnoremap L $
nnoremap H 0
