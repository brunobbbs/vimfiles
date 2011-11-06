" Basics {
set nocompatible " get out of horrible vi-compatible mode
"set background=dark " we are using a dark background
set background=light " we are using a light background
syntax on " syntax highlighting on
filetype plugin indent on " load filetype plugins and indent settings

if has("gui_running")
	" colorscheme wombat-original
	colorscheme solarized
	" colorscheme underwater-mod
	" colorscheme railscasts

	set guifont=Monaco\ 10

endif
" }

" General {
set history=1000 " How many lines of history to remember
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set fileformats=unix,dos,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set iskeyword+=_,$,@,%,# " none of these should be word dividers, so make them not be
set nostartofline " leave my cursor where it was
" }

" Files/Backups {
set sessionoptions+=globals " What should be saved during sessions being saved
set sessionoptions+=localoptions " What should be saved during sessions being saved
set sessionoptions+=resize " What should be saved during sessions being saved
set sessionoptions+=winpos " What should be saved during sessions being saved
" }

" Vim UI {
set popt+=syntax:y " Syntax when printing
set showcmd " show the command being typed
set guioptions=aer "adding others

if has("gui_running")
	set lines=41 columns=155 "Size
endif

set linespace=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set wildmode=list:longest " turn on wild menu in special format (long format)
set wildignore=*.pyc,*.pyo,*.dll,*.o,*.obj,*.bak,*.exe,*.swo,*.swp,*.jpg,*.gif,*.png " ignore some formats
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 1 high
set number " turn on line numbers
set numberwidth=4 " If we have over 9999 lines, ohh, boo-hoo
set lazyredraw " do not redraw while running macros (much faster) (LazyRedraw)
set hidden " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,[,],h,l  " backspace and cursor keys wrap to
"set mouse=a " use mouse everywhere
"set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise


"
" set list listchars=tab:\ \ ,trail:·,eol:¬ " mark trailing white space
set list listchars=tab:\ \ ,trail:· " mark trailing white space
" }

" Visual Cues {
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matching brackets for
set hlsearch
set incsearch " BUT do highlight as you type you search phrase
set scrolloff=3 " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5 " Keep 5 lines at the size
"set novisualbell " don't blink
set vb " blink instead beep
set statusline=%f%m%r%h%w\ [TYPE=%Y]\ [ENCODE=%{&fenc}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ENCODE=%{&fenc}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
" }

" Indent Related {
set nosmartindent " smartindent (filetype indenting instead)
set autoindent " autoindent (should be overwrote by cindent or filetype indent)
set cindent " do c-style indenting
set softtabstop=4 " unify
set shiftwidth=4 " unify
set tabstop=4 " real tabs should be 4, but they will show with set list on
set copyindent " but above all -- follow the conventions laid before us

" }

" Text Formatting/Layout {
"set formatoptions=tcrq " See Help (complex)
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set nowrap " do not wrap line
set preserveindent " but above all -- follow the conventions laid before us
set ignorecase " case insensitive by default
set smartcase " if there are caps, go case-sensitive
set completeopt=menu,longest,preview " improve the way autocomplete works
set nocursorcolumn " show the current column
" }

" Folding {
" set foldenable			" Turn on folding
" set foldmarker={,}		" Fold C style code (only use this as default if you use a high foldlevel)
" set foldcolumn=4		" Give 1 column for fold markers
" set foldopen-=search	" don't open folds when you search into them
" set foldopen-=undo		" don't open folds when you undo stuff
" set foldmethod=marker " Fold on the marker
" set foldlevel=1000 " Don't autofold anything (but I can still fold manually)

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
" }


" Mappings {

" Indent
noremap <F8> gg=G
inoremap <F8> <ESC>mzgg=G`z<Insert>

" Tab navigation

noremap <C-M-N> :tabnew <CR>
inoremap <C-M-N> :tabnew <CR><Insert>

noremap <C-Right> :tabn<CR>
inoremap <C-Right> <esc>:tabn<CR><Insert>

noremap <C-Left> :tabprev<CR>
inoremap <C-Left> <ESC>tabprev<CR><Insert>
" }

" Shortcut Save (default in others editors) {
noremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR><Insert>
noremap <C-X> :x<CR>
noremap <C-C> :y <CR>
" }

" Shortcuts NERDTree {
noremap <C-B> :NERDTreeToggle<CR>
" }

" Shortcuts Fuzzy Finder {
noremap <C-P> :FufFile<CR>
noremap <C-M-P> :FufBookmarkDir<CR>
noremap <C-M-A> :FufBookmarkDirAdd<CR>


" }

function LoadDjangoGoodies()

	" Django customization
	" it only works if you are at base of django site
	if filewritable('settings.py')

		" set DJANGO_SETTINGS_MODULE
		let $DJANGO_SETTINGS_MODULE=split( getcwd(),'/')[-1].".settings"
		" set right type of file, python.django for .py files,
		" htmldjango.django_template.xhtml or htmldjango.django_template.html
		" for html files. This bigname for html ft is to use both syntax of
		" Dave Hodder and SnipMate of Michael Sanders (and xhtml/html goodies
		" too)
		let l:escapefromhere=0
    	if &ft=="python"
			set ft=python.django
		elseif &ft=="html" || &ft=="xhtml"
			set ft=htmldjango.html
		else
			let l:escapefromhere=1
		endif

		if l:escapefromhere == 0
			" Set python path on enviroment, vim and python
			" if you are at /www/mysite/ we add to path /www and /www/mysite
			" so can complete mysite.
			let $PYTHONPATH .= ":/".join(split( getcwd(),'/')[-3:-2],'/')."/:/".join(split( getcwd(),'/')[0:-1],'/')."/"
			exec "set path+='/".join(split( getcwd(),'/')[0:-2],'/')."/,/".join(split( getcwd(),'/')[0:-1],'/')."/'"
			python import os,sys,vim
			exec "python sys.path.insert(0,'/".join(split( getcwd(),'/')[0:-2],'/')."')"
			exec "python sys.path.insert(0,'/".join(split( getcwd(),'/')[0:-1],'/')."')"

		endif
	endif
endfunction


" Python customization {
function LoadPythonGoodies()

	if &ft=="python"||&ft=="html"||&ft=="xhtml"

		" settings for django, for something unknow I need to call before python
		" path set
		call LoadDjangoGoodies()

		" set python path to vim
    	python << EOF
import os, sys, vim

for p in sys.path:
    if os.path.isdir(p):
		vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

		" some nice adjustaments to show errors
    	syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display 
		syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display 
		syn match pythonError "^\s*for\s.*[^:]\s*$" display 
		syn match pythonError "^\s*except\s*$" display 
		syn match pythonError "^\s*finally\s*$" display 
		syn match pythonError "^\s*try\s*$" display 
		syn match pythonError "^\s*else\s*$" display 
		syn match pythonError "^\s*else\s*[^:].*" display 
		"syn match pythonError "^\s*if\s.*[^\:]$" display 
		syn match pythonError "^\s*except\s.*[^\:]$" display 
		syn match pythonError "[;]$" display 
		syn keyword pythonError         do  

    	let python_highlight_builtins = 1
    	let python_highlight_exceptions = 1
    	let python_highlight_string_formatting = 1
    	let python_highlight_string_format = 1
    	let python_highlight_string_templates = 1
    	let python_highlight_indent_errors = 1
    	let python_highlight_space_errors = 1
    	let python_highlight_doctests = 1

		" complain to PEP 8 (Style Guide for Python Code) : http://www.python.org/dev/peps/pep-0008/
		" I added here too in case of make some shit in middle code :D
		set ai tw=79 ts=4 sts=4 sw=4 et
	
	endif

endfunction

if !exists("myautocmds")
	let g:myautocmds=1

	" Sparkup
	let g:sparkupExecuteMapping = '<c-d>'

	"call LoadPythonGoodies()
	"autocmd Filetype python,html,xhtml call LoadPythonGoodies()
	au BufNewFile,BufRead *.py,*.html call LoadPythonGoodies()

	" JSON Extension
	au BufNewFile,BufRead *.json set filetype=json foldmethod=syntax

	" Django
	autocmd FileType python set ft=python.django " For SnipMate
	autocmd FileType html set ft=htmldjango.html " For SnipMate

	" Omni completion
	"autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif
