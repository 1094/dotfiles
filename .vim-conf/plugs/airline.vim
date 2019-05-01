""" general stuff
let g:ariline#extensions#enabled = 1
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#wordcount#enabled = 0
""" symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""" status line variables
let g:airline_section_b = '%F'
let g:airline_section_c = '%m%r%h'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%5{g:word_count}W'

""" statusline layout
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

""" airline clock
" because no matter what I did `strftime` would not work
let g:airline#extensions#clock#auto = 0
let g:airline#extensions#clock#format = '%I:%M'
let g:airline#extensions#clock#update = 6000
function! AirlineInit()
	let g:airline_section_y = airline#section#create(['clock'])
endfunction
