" Unix And Windows Tabs:
nmap <A-[> ;tabprevious<ENTER>
nmap <A-]> ;tabnext<ENTER>
map <A-[> ;tabprevious<ENTER>
map <A-]> ;tabnext<ENTER>
imap <A-[> <C-O>;tabprevious<ENTER>
imap <A-]> <C-O>;tabnext<ENTER>

if has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		" Mac Tabs: 
		nmap <D-[> ;tabprevious<ENTER>
		nmap <D-]> ;tabnext<ENTER>
		map <D-[> ;tabprevious<ENTER>
		map <D-]> ;tabnext<ENTER>
		imap <D-[> <C-O>;tabprevious<ENTER>
		imap <D-]> <C-O>;tabnext<ENTER>

		" Mac Gui:
		set guioptions=egmrt
		set guifont=Monaco:h20
	else
		" Unix Gui:
		set guifont=Monospace\ 10
		map <F9> <ESC>;set guifont=Monospace\ 8<ENTER>
		map <F10> <ESC>;set guifont=Monospace\ 10<ENTER>
		map <F11> <ESC>;set guifont=Monospace\ 12<ENTER>
		map <F12> <ESC>;set guifont=Monospace\ 14<ENTER>
		
		" Remove toolbar
		set guioptions-=T
	endif
else
	" Windows Gui:
	set guifont=Consolas:h12:b
	map <F9> <ESC>;set guifont=Consolas:h8:b<ENTER>
	map <F10> <ESC>;set guifont=Consolas:h10:b<ENTER>
	map <F11> <ESC>;set guifont=Consolas:h12:b<ENTER>
	map <F12> <ESC>;set guifont=Consolas:h14:b<ENTER>

	" Remove toolbar
	set guioptions-=T
endif

