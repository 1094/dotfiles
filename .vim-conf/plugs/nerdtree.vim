" nerdtree
autocmd StdinReadPre * let s:std_in=1
"
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"
map .l :NERDTreeToggle<CR>
"
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
"
" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
