""" plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""" the Plugs
call plug#begin('~/.vim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'
Plug 'chusiang/vim-sdcv'
Plug 'vim-scripts/fountain.vim'
Plug 'Konfekt/vim-scratchpad'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'reedes/vim-wordy'
Plug 'gu-fan/riv.vim'
Plug 'gu-fan/InstantRst'
call plug#end()
""" filetype and syntax 
filetype plugin on
syntax on
""" for the Markdown folding
"if has("autocmd")
"	filetype plugin indent on
"endif
"""" set
set mouse-=a
set linebreak
set wrap
set nolist
set spelllang=en_us
"set smarttab
set tabstop=5
set shiftwidth=0
set expandtab
set showcmd
set conceallevel=3
set scrolloff=2
set laststatus=2
set incsearch
set foldenable
set foldmethod=manual
set listchars=trail:•,tab:▸-,nbsp:+
"""" highlight 
""""" spell 
hi clear SpellBad
hi SpellBad ctermbg=NONE cterm=underline
hi clear SpellCap
hi SpellCap ctermfg=NONE ctermbg=NONE cterm=NONE
hi clear Spelllocal
hi Spelllocal ctermbg=NONE cterm=NONE
hi clear SpellRare
hi SpellRare ctermbg=NONE cterm=NONE
"hi clear Visual
"hi Visual ctermfg=Black ctermbg=Cyan cterm=NONE
""""" markdown brackets
hi clear markdownError
hi link markdownError normal
""" maps
"""" fold toggle
inoremap <Leader>f <C-O>za
nnoremap <Leader>f za
onoremap <Leader>f <C-C>za
vnoremap <Leader>f zF
nnoremap <Leader>cc zM
nnoremap <Leader>oo zR
"""" noremap
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap 0 g0
noremap $ g$
noremap <Tab> :bn<CR>
noremap <S-Tab> :wincmd w<CR>
noremap <Leader>bn :bn<CR>
noremap <Leader>bp :bp<CR>
noremap <Leader>ww :wincmd w<CR>
noremap <Leader>tn :tabnext<CR>
"""" map
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
"""" cabbrev
cabbrev smy set mouse=a<CR>
cabbrev smn set mouse-=a<CR>
cabbrev vv e ~/.vimrc<CR>
cabbrev vz e ~/.zshrc<CR>
cabbrev v3 e ~/.config/i3/config<CR>
cabbrev cc close<CR>
cabbrev def call SearchWord()<CR>
cabbrev num set number!<CR>
cabbrev rnum set relativenumber!<CR>
cabbrev spell set spell!<CR>
"""" iabbrev
iabbrev Mirnada Miranda
iabbrev ANdy Andy
iabbrev adn and
iabbrev tmw tomorrow
""" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
""" Functions
"""" word count
let g:word_count="..."
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
set updatetime=100
"""" folding
""""" thank you godlygeek
function HashtagFolds()
	:set fdm=expr
	:set fdl=0
	:set fde=getline(v\:lnum)=~'^#'?'>'.(matchend(getline(v\:lnum),'#*')-1)\:'='
endfunction
function EqualFolds()
	:set fdm=expr
	:set fdl=0
	:set fde=getline(v\:lnum)=~'^='?'>'.(matchend(getline(v\:lnum),'=*')-1)\:'='
endfunction
function ConfigFolds()
	:set fdm=expr
	:set fdl=0
	:set fde=getline(v\:lnum)=~'^##'?'>'.(matchend(getline(v\:lnum),'##*')-2)\:'='
endfunction

"""" Mike's Battery
let g:battery_level = ''
function! SetBatteryLevel(timer_id)
	let l:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
	if (battery_level != '')
		let g:battery_level = l:battery_level
		redraw!
	endif
	call timer_start(30000, 'SetBatteryLevel')
endfunction
"""""" source
" https://michelerullo.wordpress.com/2018/02/16/hot-to-show-time-and-battery-status-on-vim-8-statusline/
""" Plugins
"""" airline
""""" general stuff
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#wordcount#enabled = 0
""""" status line variables ======
let g:airline_section_b = '%F'
let g:airline_section_c = '%m%r%h'
let g:airline_section_y = '%5{g:word_count}W'
let g:airline_section_z = '%{g:battery_level}'
""""" statusline layout ======
let g:airline#extensions#default#layout = [
	\ [ 'a', 'b', 'c' ],
	\ [ 'y', 'z' ]
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
""""" symbols ======
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"""" airline clock
" because no matter what I did `strftime` would not work
let g:airline#extensions#clock#auto = 0
let g:airline#extensions#clock#format = '%I:%M'
let g:airline#extensions#clock#update = 6000
function! AirlineInit()
	let g:airline_section_z = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_z])
endfunction
"""" scratchpad
let g:scratchpad_ftype = 'rst'
nmap sp <Plug>(ToggleScratchPad)
"""" FZF
nmap fzf :FZF<CR>
nmap find :Lines<CR>
"""" wordy
noremap <silent> <F2> :<C-u>NextWordy<CR>
xnoremap <silent> <F2> :<C-u>NextWordy<CR>
inoremap <silent> <F2> :<C-u>NextWordy<CR>
nmap <silent> <F1> :Wordy off<CR>
"""" rST Table Formatter
nmap <Leader><Leader>C :call ReflowTable()<CR>
"""" InstantRST
cabbrev show InstantRst<CR>
cabbrev noshow StopInstantRst<CR>
let g:instant_rst_browser = 'qutebrowser'
""" auto commands
"""" hello vim
augroup hello_vim
	au!
	au VimEnter * call SetBatteryLevel(0)
	au User AirlineAfterInit call AirlineInit()
	au BufEnter * if &filetype == """ | setlocal ft=markdown | endif
augroup END
"""" remember_folds
augroup remember_folds
	au!
	au BufWrite ?* mkview!
	au BufEnter ?* silent loadview
augroup END
"""" set_filetypes
augroup set_filetypes
	au!
	au BufNew,BufRead,BufNewFile *.fountain set ft=fountain
	au BufNew,BufRead,BufNewFile *.md set ft=markdown
	au BufNew,BufRead,BufNewFile *.mkd set ft=markdown
     au BufNew,BufRead,BufNewFile /tmp/*.txt set ft=rst 
augroup END
"""" folding
augroup the_folds
	au!
	au FileType markdown setlocal foldexpr=HashtagFolds() | setlocal foldmethod=expr
	au FileType conf setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
	au FileType zsh setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
	au FileType text setlocal foldexpr=EqualFolds() | setlocal foldmethod=expr
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
""" sources
:so ~/.vim/ftplugin/rst_tables.vim
""" vim:fdm=expr:fdl=0
"""" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
