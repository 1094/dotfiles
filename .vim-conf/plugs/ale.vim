let g:ale_sign_column_always = 1
let g:ale_sign_error = '-'
let g:ale_sign_warning = '>'
let g:ale_enabled = 0
let g:ale_echo_msg_format = '%s'
let g:ale_set_highlights = 1
let g:ale_set_balloons = 0

noremap <leader>a :ALEToggle<CR>

let g:ale_fixers = [
\	'vale',
\	'vint',
\	'shellcheck',
\ ]

let g:ale_linters_explicit = 1
let g:ale_linters = {
			\ 'bash' : ['shellcheck'],
			\ 'zsh' : ['shellcheck'],
			\ 'asciidoc' : ['vale'],
			\ 'text' : ['vale'],
			\ 'markdown' : ['vale'],
			\ 'rst' : ['vale'],
			\ 'vim' : ['vint'],
			\}

" ~/.vim/plugged/ale/autoload/ale/highlight.vim >> add ``highlight clear SignColumn``  to the very end
