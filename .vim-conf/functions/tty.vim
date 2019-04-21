function! BatteryTimeOn()
	:call SetBatteryLevel(0)
	:colorscheme cosme
	let g:airline_section_x = '%5{g:word_count}W'
	let g:airline_section_z = '%{g:battery_level}'
	let g:airline_section_y = airline#section#create(['clock'])
endfunction
