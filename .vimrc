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
"Plug 'matcatc/vim-asciidoc-folding'
Plug 'mhinz/vim-startify'
call plug#end()
""" settings
filetype plugin indent on
syntax on
"
"colorscheme cosme
"
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
"
""" augroup
augroup hello_vim
	au!
	au CursorHold,CursorHoldI * call UpdateWordCount()
	au FileType asciidoc,markdown,rst,txt set spell
	au BufEnter /tmp/*.txt set ft=asciidoc
	au FileType sh,zsh,muttrc,conf setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
	au BufWrite ?* mkview!
	au BufEnter ?* silent loadview
augroup END
"
""" normal maps
noremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap ,w :w <C-R>=expand("%:p:h") . "/" <CR>
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
"
"""" other
so $HOME/.vim-conf/brev.vim
so $HOME/.vim-conf/hi.vim

""" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
