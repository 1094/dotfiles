" Fix files
let b:ale_fixers = { 
\    'markdown' : ['write-good', 'proselint', 'vale'], 
\    'python' : ['prospector', 'pylint'],
\    'vim' : ['vint'],
\    'rst' : ['rstcheck'],
\}
