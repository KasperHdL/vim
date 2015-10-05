"Call Pathogen
execute pathogen#infect()
execute pathogen#helptags()

"Settings stuff
syntax on
filetype plugin indent on

"GitGutter
let g:gitgutter_sign_column_always = 1

"ColorScheme
color jellybeans
let g:jellybeans_use_lowcolor_black = 0

"indentLine
let g:indentLine_char = '|'

"TagBar
nmap <F8> :TagbarToggle<CR>

"Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

"Nerdtree
nmap <F7> :NERDTreeToggle<CR>

"Single-Lines
set relativenumber
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set expandtab
set hidden


"Remappings
map <C-h> <C-w>h	
map <C-j> <C-w>j	
map <C-k> <C-w>k	
map <C-l> <C-w>l	

"Auto-Reload Vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
