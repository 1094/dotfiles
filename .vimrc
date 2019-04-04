""" plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""" the Plugs
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'chusiang/vim-sdcv'
Plug 'vim-scripts/fountain.vim'
Plug 'w0rp/ale'
Plug 'lilydjwg/fcitx.vim'
Plug 'scrooloose/nerdtree'
Plug 'masukomi/vim-markdown-folding'
Plug 'beikome/cosme.vim'
call plug#end()

""" filetype and syntax 
filetype plugin on
syntax on
filetype indent off
""" highlight
"""" spell 
hi clear SpellBad
hi SpellBad ctermbg=NONE cterm=underline
hi clear SpellCap
hi SpellCap ctermfg=NONE ctermbg=NONE cterm=NONE
hi clear Spelllocal
hi Spelllocal ctermbg=NONE cterm=NONE
hi clear SpellRare
hi SpellRare ctermbg=NONE cterm=NONE
"""" markdown brackets
hi clear markdownError
hi link markdownError normal
""" set
set mouse-=a
set linebreak
set wrap
set nolist
set spelllang=en_us
set spelllang+=cjk
set showcmd
set conceallevel=3
set scrolloff=2
set laststatus=2
set incsearch
set foldenable
set foldmethod=manual
"set listchars=trail:•,tab:▸-,nbsp:+
set tabstop=5
set softtabstop=5

""" maps

"""" fold toggle
noremap ff <C-O>za
nnoremap ff za
onoremap ff <C-C>za
vnoremap ff zF
nnoremap fC zM
nnoremap fO zR

"""" normal
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap 0 g0
noremap $ g$
noremap <Tab> :bn<CR>
noremap <S-Tab> :wincmd w<CR>
noremap <F12> :! clear; python %<CR>
noremap <F3> :set spell!<CR>
noremap <C-o> o<Esc>

"""" insert
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

"""" map
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
map ,l :lopen<CR>

"""" cabbrev
cabbrev smy set mouse=a<CR>
cabbrev smn set mouse-=a<CR>
cabbrev vv e ~/.vimrc<CR>
cabbrev vz e ~/.zshrc<CR>
cabbrev v3 e ~/.config/i3/config<CR>
cabbrev vq e ~/.config/qtile/config.py<CR>
cabbrev va e ~/.zalias<CR>
cabbrev cc close<CR>
cabbrev def call SearchWord()<CR>
cabbrev num set number!<CR>
cabbrev rnum set relativenumber!<CR>
cabbrev Q qall
cabbrev wQ wqall
cabbrev m2h call Md2html()<CR>
cabbrev tty call BatteryTimeOn()<CR>

"""" iabbrev
iabbrev Mirnada Miranda
iabbrev ANdy Andy
iabbrev adn and
iabbrev tmw tomorrow
iabbrev NIgel Nigel
iabbrev wtag! <a href="/tagged/"></a><br/>

""" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

""" Functions

"""" word count
let g:word_count='...'
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
set updatetime=300

"""" folding
"thank you godlygeek

""""" config
function ConfigFolds()
	:set foldmethod=expr
	:set foldlevel=0
	:set foldexpr=getline(v\:lnum)=~'^##'?'>'.(matchend(getline(v\:lnum),'##*')-2)\:'='
endfunction

"""" Mike's Battery
let g:battery_level = ''
function! SetBatteryLevel(timer_id)
	let l:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
	if (battery_level !=# '')
		let g:battery_level = l:battery_level
		redraw!
	endif
	call timer_start(30000, 'SetBatteryLevel')
endfunction
" source
" https://michelerullo.wordpress.com/2018/02/16/hot-to-show-time-and-battery-status-on-vim-8-statusline/

"""" convert Markdown to HTML
function Md2html()
	:enew
	:exe "read !pandoc " . shellescape(@#, 1)
	:set ft=html
	:%!tidy -q -i --show-errors 0
endfunction
" source 
" http://vim.1045645.n5.nabble.com/convert-markdown-to-html-in-new-tab-td5719856.html
" https://stackoverflow.com/questions/9499166/vim-automatically-formatting-html-files-with-tidy-and-script-tag-with-jsbeauti

"""" show battery & time
function! BatteryTimeOn()
	let g:airline_section_x = '%5{g:word_count}W'
	let g:airline_section_z = '%{g:battery_level}'
	let g:airline_section_y = airline#section#create(['clock'])
	" fbterm doesn't do base16-shell
	:colo cosme
endfunction

""" Plugins

"""" airline

""""" general stuff
let g:ariline#extensions#enabled = 1
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#wordcount#enabled = 0
""""" symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""""" status line variables
let g:airline_section_b = '%F'
let g:airline_section_c = '%m%r%h'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%5{g:word_count}W'

""""" statusline layout
let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'x', 'y', 'z' ]
	\ ]
let g:airline#extensions#default#section_truncate_width = {
	\ 'a': 1,
	\ 'b': 1,
	\ 'c': 1,
	\ 'x': 1,
	\ 'y': 1,
	\ 'z': 1,
	\ }
let g:airline_theme = 'papercolor'
let g:airline_symbols_ascii = 1
let g:airline_powerline_fonts = 0

"""" airline clock
" because no matter what I did `strftime` would not work
let g:airline#extensions#clock#auto = 0
let g:airline#extensions#clock#format = '%I:%M'
let g:airline#extensions#clock#update = 6000
function! AirlineInit()
	let g:airline_section_y = airline#section#create(['clock'])
endfunction
"""" MD Folding
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()
map ,f :FoldToggle<CR>

"""" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'
let g:ale_enabled = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
noremap <F2> :ALEToggle<CR>
" ~/.vim/plugged/ale/autoload/ale/highlight.vim >> add ``highlight clear SignColumn``  to the very end

"""" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map .l :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = '' 

""" auto commands

"""" hello vim
augroup hello_vim
	au!
	au VimEnter * call SetBatteryLevel(0)
"	au User AirlineAfterInit call AirlineInit()
	au BufEnter * if &filetype == """ | setlocal ft=markdown | endif
augroup END

"""" remember_folds
augroup remember_folds
	au!
	au BufWrite ?* mkview!
	au BufEnter ?* silent loadview
augroup END

"""" set file types
augroup set_filetypes
	au!
	au BufNew,BufRead,BufNewFile *.fountain set ft=fountain
	au BufNew,BufRead,BufNewFile *.md set ft=markdown
	au BufNew,BufRead,BufNewFile *.mkd set ft=markdown
     au BufNew,BufRead,BufNewFile /tmp/*.txt set ft=markdown 
augroup END

"""" folding
augroup the_folds
	au!
	au FileType sh,zsh,muttrc,conf setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
augroup END

"""" word_counter
augroup word_counter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

"""" spell checker
augroup spell_checker
	au!
	au FileType markdown,text,rst set spell
augroup END

""" vim:fdm=expr:fdl=0
"""" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
