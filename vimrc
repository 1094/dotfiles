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
Plug 'Konfekt/vim-scratchpad'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gu-fan/riv.vim'
Plug 'gu-fan/InstantRst'
Plug 'metakirby5/codi.vim'
Plug 'skywind3000/asyncrun'
Plug 'w0rp/ale'
call plug#end()
""" filetype and syntax 
filetype plugin on
syntax on
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
set tabstop=5
set expandtab
set showcmd
set conceallevel=3
set scrolloff=2
set laststatus=2
set incsearch
set foldenable
set foldmethod=manual
set listchars=trail:•,tab:▸-,nbsp:+
""" maps
"""" fold toggle
inoremap ff <C-O>za
nnoremap ff za
onoremap ff <C-C>za
vnoremap ff zF
nnoremap fC zM
nnoremap fO zR
"""" noremap
noremap j gj
noremap k gk
noremap gk k
noremap gj j
noremap 0 g0
noremap $ g$
noremap <Tab> :bn<CR>
noremap <S-Tab> :wincmd w<CR>
"""" map
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
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
set updatetime=100
"""" folding
""""" markdown
"thank you godlygeek
function HashtagFolds()
	:set foldmethod=expr
	:set foldlevel=0
	:set foldexpr=getline(v\:lnum)=~'^#'?'>'.(matchend(getline(v\:lnum),'#*')-1)\:'='
endfunction
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
"""""" source
" https://michelerullo.wordpress.com/2018/02/16/hot-to-show-time-and-battery-status-on-vim-8-statusline/
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
"""" Riv
let g:riv_ignored_nmaps = '<Tab>,<S-Tab>'
let g:riv_ignored_maps = '<Tab>,<S-Tab>'
let g:riv_ignored_imaps = '<Tab>,<S-Tab>'
let g:riv_ignored_vmaps = '<Tab>,<S-Tab>'
"""" rST Table Formatter
nmap <Leader><Leader>C :call ReflowTable()<CR>
"""" InstantRST
cabbrev show InstantRst<CR>
cabbrev noshow StopInstantRst<CR>
let g:instant_rst_browser = 'qutebrowser'
"""" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E-'
let g:ale_sign_warning = 'W-'
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
	au FileType markdown,text setlocal foldexpr=HashtagFolds() | setlocal foldmethod=expr
	au FileType zsh,muttrc,conf setlocal foldexpr=ConfigFolds() | setlocal foldmethod=expr
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
:so ~/.vim/ftplugin/javascript.vim
""" vim:fdm=expr:fdl=0
"""" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
