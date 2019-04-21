" Mike's Battery
let g:battery_level = ''
function! SetBatteryLevel(timer_id)
	let l:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
	if (battery_level !=# '')
		let g:battery_level = l:battery_level
		redraw!
	endif
	call timer_start(30000, 'SetBatteryLevel')
endfunction
" source
" https://michelerullo.wordpress.com/2018/02/16/hot-to-show-time-and-battery-status-on-vim-8-statusline
