""" plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""" the Plugs
call plug#begin('~/.vim/plugged')
Plug 'beikome/cosme.vim'
Plug 'lilydjwg/fcitx.vim'
Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'chusiang/vim-sdcv'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'itmm/vim-asciidoc'
" always last
Plug 'ryanoasis/vim-devicons'
call plug#end()
""" settings
filetype plugin indent on
syntax on
"
let g:asciidoc_folding=1
"colorscheme cosme
"
set encoding=UTF-8
set mouse-=a
set linebreak
set wrap
set nolist
set spelllang=en_us
set spelllang+=cjk
set showcmd
set conceallevel=3
set laststatus=2
set incsearch
set listchars=trail:•,tab:▸-,nbsp:+
set thesaurus+=$HOME/.vim/thesaurus/mthesaur.txt
set scrolloff=999
"
""" augroup
augroup hello_vim
	au!
	au CursorHold,CursorHoldI * call UpdateWordCount()
	au BufEnter,BufWrite,BufRead,BufNewFile /tmp/*.txt set filetype=asciidoc
	au BufEnter,BufWrite,BufRead,BufNewFile ?*.adoc set filetype=asciidoc | set spell
	au BufEnter,BufWrite,BufRead $HOME/rmf/*.adoc set nospell
	au FileType sh,zsh,muttrc,conf setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
	au FileType vim setlocal foldexpr=VimFolds() | setlocal foldmethod=expr
	au BufWrite ?* mkview!
	au BufEnter ?* silent loadview
augroup END
"
""" normal maps
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,w :w <C-R>=expand("%:p:h") . "/" <CR>
noremap ,h :e $HOME/words/
noremap <Tab> :bn<CR><CR>
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap 0 g0
noremap $ g$
noremap ) f.
noremap <leader>o i<CR><CR>
noremap zz :bd<CR>
"
""" insert maps
inoremap <leader>o <esc>o
inoremap <leader>dd <esc>ddi
inoremap <leader>S .<esc>(df.
inoremap <leader>s <esc>(df.
inoremap <leader><leader>w <esc>:w<CR>i
"
""" sources
"""" plug settings
so $HOME/.vim-conf/plugs/airline.vim
so $HOME/.vim-conf/plugs/nerdtree.vim
so $HOME/.vim-conf/plugs/startify.vim
so $HOME/.vim-conf/plugs/ale.vim
"""" functions
so $HOME/.vim-conf/functions/wordcount.vim
so $HOME/.vim-conf/functions/battery.vim
so $HOME/.vim-conf/functions/tty.vim
so $HOME/.vim-conf/functions/config-folds.vim
so $HOME/.vim-conf/functions/adoc-clean.vim
so $HOME/.vim-conf/functions/vim-fold.vim
so $HOME/.vim-conf/functions/dupe-lines.vim
"
"""" other
so $HOME/.vim-conf/brev.vim
so $HOME/.vim-conf/hi.vim
