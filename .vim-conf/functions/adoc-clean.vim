function Adoctidy()
	:%s/<div class="paragraph">//g
	:%s/<\/div>//g
	normal! G2dd
	normal! <CR>
endfunction
