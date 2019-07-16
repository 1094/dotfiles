let g:startify_custom_header = startify#fortune#boxed()
let g:startify_files_number = 5
let g:startify_lists = [
	\ { 'type': 'sessions', 'header': ['   Session'] },
	\ { 'type': 'files', 'header': [ '   MRU'] },
	\ { 'type': 'bookmarks', 'header': [ '   Bookmarks'] },
	\ ]

let g:startify_bookmarks = [
	\ '~/words/hmh',
	\ '~/words/iw',
	\ '~/words/tales',
	\ '~/words/moments.adoc',
	\ '~/words/working-title',
	\ ]
