"thank you godlygeek
function VimFolds()
	:set foldmethod=expr
	:set foldlevel=0
	:set foldexpr=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'=
endfunction
