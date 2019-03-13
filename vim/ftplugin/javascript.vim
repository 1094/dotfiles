" Fix files
let b:ale_fixers = { 
\    'markdown' : ['proselint'], 
\    'text' : ['proselint'], 
\    'python' : ['prospector', 'pylint'],
\    'vim' : ['vint'],
\    'rst' : ['rstcheck', 'proselint'],
\    'sh' : ['shellcheck'],
\    'zsh' : ['shellcheck'],
\}
" testing linters
" add write-good and vale one at a time after seeing if proselint is ~good
" enough~
