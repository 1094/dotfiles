" =======================
" ====== wordcount ======
" =======================
" cuz works w/all files
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
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=50
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
" =====================
" ====== airline ======
" =====================
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#wordcount#enabled = 0
" ====== status line variables ======
let g:airline_section_b = '%m %r'
let g:airline_section_c = '%f'
" let g:airline_section_x =
let g:airline_section_y = '%5{WordCount()}'
let g:airline_section_z = '%4L'
" ====== statusline layout ======
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
let g:airline_powerline_fonts = 1
" ====== symbols ======
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" ====== unicode symbols ======
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
" ====== airline symbols ======
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ==================
" ====== gvim ======
" ==================
set guifont=CodeNewRoman\ NF\ Book\ 10
set guioptions -=T
if has("gui_running")
	cabbrav fm :Ex<CR>
endif
" ====================
" ====== ranger ======
" ====================
function! RangeChooser()
    let temp = tempname()
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
" =====================
" ====== folding ======
" =====================
function MarkdownLevel()
	let h = matchstr(getline(v:lnum), '^#\+')
	if empty(h)
		return "="
	else
		return ">1"
endif
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.txt setlocal foldexpr=MarkdownLevel()
au BufEnter *.txt setlocal foldmethod=expr

set nocompatible
if has("autocmd")
	filetype plugin indent on
endif
" ==================
" ====== Goyo ======
" :q last buffer
" ==================
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
