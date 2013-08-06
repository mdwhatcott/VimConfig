" Pathgen:
	filetype off
	call pathogen#helptags()
	call pathogen#runtime_append_all_bundles()

" Remappings:

	" IMPORTANT: Swap ; and : to save our pinky fingers.
	" This means that each command in this file that would use a 
	" colon to enter a command now must use a semicolon.
	nnoremap ; :
	nnoremap : ;
	vnoremap ; :
	vnoremap : ;

	" Create Blank Newlines and stay in Normal mode
	nnoremap <silent> zj o<Esc>
	nnoremap <silent> zk O<Esc>

	" Move cursor together with the screen
	noremap <c-j> j<c-e>
	noremap <c-k> k<c-y>

	" Calls the Molly 'Command-T' plugin
	let mapleader = ","
	map <Leader>t ;Molly<RETURN>

" Appearance:
	colorscheme wombat
	syntax on
	set number
	set ruler
	set display=lastline
	set nowrap
	set mousehide " during typing
	set cursorline " highlight current line

	" always keep file columns and rows below and beside the cursor
	set scrolloff=5
	set sidescrolloff=5

	" GoLang file:
	set rtp+=/usr/local/go/misc/vim

" Editing:
	filetype indent plugin on

	" use a tab of length 4 as the default
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set smartindent


	" Search mappings: These will make it so that going to the next one in a
	" search will center on the line it's found in.
	map N Nzz
	map n nzz

	" GoLang:
	au BufRead,BufNewFile *.go set filetype=go

	" Ruby-specific whitespace rules:
	au BufRead,BufNewFile *.rb set tabstop=2
	au BufRead,BufNewFile *.rb set shiftwidth=2
	au BufRead,BufNewFile *.rb set softtabstop=2

	" Python-specific whitespace rules:
	au BufRead,BufNewFile *.py set expandtab " no tabs in python

	" Text file rules:
	"   Wrapping:
	au BufRead,BufNewFile *.txt,*.rst set wrap
	au BufRead,BufNewFile *.txt,*.rst set formatoptions=1
	au BufRead,BufNewFile *.txt,*.rst set lbr
	"   Navigation: Allows normal up/down motion in a wrapped line
	au BufRead,BufNewFile *.txt noremap <buffer> j gj
	au BufRead,BufNewFile *.txt noremap <buffer> k gk

	set backspace=2
	set whichwrap=b,s,<,>,h,l

	set noswapfile

" Code Folding:
	set foldenable
	set foldmethod=syntax
	au BufRead,BufNewFile *.py set foldmethod=indent
	set foldlevel=100

	function! JavaScriptFold() 
		setl foldmethod=syntax
		setl foldlevelstart=1
		syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

		function! FoldText()
			return substitute(getline(v:foldstart), '{.*', '{...}', '')
		endfunction
		setl foldtext=FoldText()
	endfunction

	au FileType javascript call JavaScriptFold()
	au FileType javascript setl fen
	
	" enable space-bar-toggled-folding
	nnoremap <space> za " toggle a single fold

" Plugin Mappings:
	"" TODO: think of good shortcuts for this...
	" Nerd Tree shortcut
	""map <F8> <ESC>;NERDTreeToggle<RETURN>

	" switch between nerdtree and editor
	""map <F2> <ESC><C-W>w

" Searching:
	set ignorecase " lower case search is case-insensitive
	set smartcase " any upper case character triggers case-sensitive search
	set incsearch " highlight search string as it is being typed
