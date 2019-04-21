function Md2html()
	enew!
	exe "read !pandoc --lua-filter=$HOME/txt/plf/remove-attr.lua " . shellescape(@#, 1)
	set ft=html
	%!tidy -q -i --show-errors 0
	" next line deletes the header and footer
	normal! 8ddGk2ddgg
endfunction
