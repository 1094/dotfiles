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
set nolist
set spelllang=en_us
set smarttab
set showcmd
set conceallevel=3
set scrolloff=2
set laststatus=2
set incsearch

" ====== list ======
set listchars=trail:•,tab:▸-,nbsp:+

" ====== highlight ======
hi clear SpellBad
hi SpellBad ctermfg=DarkMagenta ctermbg=NONE cterm=underline
hi clear SpellCap
hi SpellCap ctermfg=NONE ctermbg=NONE cterm=NONE
hi clear Spelllocal
hi Spelllocal ctermfg=DarkMagenta ctermbg=NONE cterm=NONE
hi clear SpellRare
hi SpellRare ctermfg=LightMagenta ctermbg=NONE cterm=NONE
hi clear Visual
hi Visual ctermfg=Black ctermbg=Cyan cterm=NONE

" ====== leader ======
nnoremap <leader><leader> :ls<CR>

" ====== maps ======
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap 0 g0
noremap $ g$
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
map -w :w!
map -b :b!
map -q :q!
map -e :e!

noremap <Tab> :bn<CR>
noremap <S-Tab> :wincmd w<CR>
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
au BufRead,BufNewFile *.txt set filetype=markdown

" ====== autoplugs ======
let g:loaded_matchparen = 1

" ====== others ======
so ~/.vim/more.vim
so ~/.vim/brev.vim
