if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'chusiang/vim-sdcv'
Plug 'fmoralesc/vim-pad'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/fountain.vim'
call plug#end()

" ====== on ======
filetype plugin on
syntax on

" ====== set ======
set mouse-=a
set linebreak
set wrap
set spelllang=en_us
set smarttab
set showcmd
set conceallevel=3
set scrolloff=2
set laststatus=2
set showtabline=2
set nosmd
set incsearch
set noshowmatch
" ====== spaces ======
set listchars=trail:◦,tab:▸-,nbsp:+
" ====== highlight ======
hi clear SpellBad
hi SpellBad term=NONE ctermbg=NONE cterm=underline
hi clear SpellCap
hi SpellCap term=NONE ctermbg=NONE cterm=NONE
" ====== cabbrev ======
cabbrev sma set mouse=a<CR>
cabbrev sm- set mouse-=a<CR>
cabbrev vv e ~/.vimrc<CR>
cabbrev help tab help
cabbrev fm RangerChooser<CR>
cabbrev cc close<CR>
cabbrev mr MRU<CR>
cabbrev pn Pad new<CR>
cabbrev pl Pad ls<CR>
cabbrev ps Pad search<CR>
cabbrev em NotMuch<CR>
cabbrev def call SearchWord()<CR>
cabbrev G Goyo<CR>

" ====== leader ======
nnoremap <leader><leader> :ls<CR>

" ====== maps ======
noremap j gj
noremap k gk
noremap gk k
noremap gj j
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
map Tab :bn<CR>
map -w :w!
map -b :b!
map -q :q!
map -e :e!
" ====== netrw ====== 
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" ====== vim-pad ======
let g:pad#dir="~/.vpad/"

" ====== MRU ======
let g:MRU_Use_Current_Window=1
let g:MRU_Max_Menu_Entries=15

" ====== fauntain ======
au BufRead,BufNewFile *.fountain set filetype=fountain

" ====== buftabline ======
let g:buftabline_numbers=1
let g:buftabline_show=2
let g:buftabline_indicators=1
let g:buftabline_separators=1

" ====== others ======
so ~/.vim/more.vim
