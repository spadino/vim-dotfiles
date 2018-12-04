let g:airline_theme='angr'

set directory=$HOME/.tmp/
set backupdir=$HOME/.tmp/
set undodir=$HOME/.tmp/

set termguicolors
set t_Co=256

set tabstop=4
set ff=unix
set number

set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

set nowrap

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" base16-vim
Plug 'chriskempson/base16-vim'


Plug 'sheerun/vim-polyglot'

Plug 'godlygeek/tabular'

Plug 'roman/golden-ratio'

" GitGutter
Plug 'airblade/vim-gitgutter'
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" Markdown
Plug 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Eunuch
Plug 'tpope/vim-eunuch'

" NERDTree
Plug 'scrooloose/nerdtree'
map <C-o> :NERDTreeToggle<CR>

Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Clever number line
Plug 'myusuf3/numbers.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'


" section for os/version specific plugins
let g:os = substitute(system('uname'), '\n', '', '')
if g:os == 'Linux' || g:os == 'Darwin'
		" Syntax
		Plug 'scrooloose/syntastic'
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0

		" Multiple Plug commands can be written in a single line using | separators
		Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
		" Enable snipMate compatibility feature.
		let g:neosnippet#enable_snipmate_compatibility = 1

		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*
else " windows
    " do windows command
endif

" specific for running under GUI
if has("gui_running")
    if g:os == "Darwin"
		" osx
    elseif g:os == "Linux"
		" linux
    elseif g:os == "Windows"
        set guifont=Consolas:h12:cANSI
    endif
endif

" PromptLine
Plug 'edkolev/promptline.vim'

" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:promptline_theme = 'airline'

" Airline symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Initialize plugin system
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
