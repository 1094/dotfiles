"====== ranger ======
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

" ====== folding ======
function MarkdownLevel()
	let h = matchstr(getline(v:lnum), '^#\+')
	if empty(h)
		return "="
	else
		return ">" . len(h)
	endif
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr

"====== Goyo ======
"Ensure :q to quit even when Goyo is active

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
let g:goyo_width = 90

" ====== Airline ======
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#formatter#default#fmt = '%sW'
let g:airline#extensions#whitespace#enable = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
" ====== status line variables ======
let g:airline_section_c = '%m %r'
let g:airline_section_b = '%f'
let g:airline_section_z = '%d'
" ====== statusline layout ======
let g:airline#extensions#default#layout = [
	\ [ 'a', 'c', 'b' ],
	\ [ 'z' ]
	\ ]
let g:airline#extensions#default#section_truncate_width = {
	\ 'a': 1,
	\ 'c': 15,
	\ 'b': 15,
	\ 'z': 1,
	\ }
