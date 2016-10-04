" Vim Config
"   by KasperHdL
"
"
""""""""""""""""""""""""""""

""""""""""""""""""""""""""""
" =>  Uncategorized
""""""""""""""""""""""""""""

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" @TODO to be categorized

set ttyfast
"""""""""""""""""""
" => Launch Config 
"""""""""""""""""""

execute pathogen#infect()
execute pathogen#helptags()
set encoding=utf-8

"No backup n stuff ..
set nobackup
set nowb
set noswapfile

"reads the file automatically if it has been changed outside
set autoread
set hidden

"""""""""""""""""""
" => Colors 
"""""""""""""""""""
syntax on
color jellybeans
let g:jellybeans_use_lowcolor_black = 0

""""""""""""""""""""""""
" => Spaces & Tabs 
"""""""""""""""""""""""
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry


""""""""""""""
" Make!
""""""""""""""
let &makeprg = 'cd bin && cmake .. && make && ./$*'


""""""""""""""""""""""
" => Multiple Cursors
""""""""""""""""""""""

let g:multi_cursor_next_key='<C-,>'
let g:multi_cursor_prev_key='<C-.>'
let g:multi_cursor_skip_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'


"""""""""""""""""""""""""
" => UI Layout 
"""""""""""""""""""""""""""
set relativenumber      " show relative line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis

let g:gitgutter_sign_column_always = 1
let g:bufferline_show_bufnr = 1


""""""""""""""""""""
" => Searching 
""""""""""""""""""""
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches


""""""""""""""""""""
" => Folding 
""""""""""""""""""""
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1


""""""""""""""""""""
" => Shortcuts 
"""""""""""""""""""
" === Leader ===
let mapleader="\<Space>"
let g:mapleader="\<Space>"


" remap 0 to the first blank character in the line
map 0 ^

nnoremap <Leader>, :nohlsearch<CR>
nnoremap <Leader>t :Tabularize /
vnoremap <Leader>t :Tabularize /

" === Plugin ===
nnoremap <F7> :NERDTreeToggle<CR> 
nnoremap <F8> :TagbarToggle<CR>  
nnoremap <leader>a :Ag
inoremap jk <ESC>

" === Window Management ===	" Switch Focus with cursor motion keys
map <C-h> <C-w>h		
map <C-j> <C-w>j	
map <C-k> <C-w>k	
map <C-l> <C-w>l

" Move a line of text using ALT+[jk] or Cmd+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z

vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z 

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif


"""""""""""""""""""""
" => Airline {{{
"""""""""""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1


"""""""""""""""""""""
"Rainbow Parenthesis {{{
"""""""""""""""""""""
"@TODO learn what these does..
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""
" => CtrlP 
"""""""""""""""""""""
let g:ctrlp_user_command = 'ag %s -l --hidden -g ""'

set wildignore+=*/tmp/*,*/docs/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*\\docs\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"""""""""""""""""""""
" => Syntastic 
"""""""""""""""""""""
"let syntastac ignore file types
let g:syntastic_ignore_files = ['.java$']
"@TODO learn what these does..
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""
" => Commands
""""""""""""""""""""

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""
" => Work around for Gnome-terminal and Meta/Alt Key
"""""""""""""""""""""""""
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

""""""""""""""""""""""""""
" => Auto-Reload Vimrc 
"""""""""""""""""""""""""

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $
augroup END " }
