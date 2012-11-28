
""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""
set modeline
set modelines=5
set nocompatible

set spell spelllang=en_us

" Display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.py[co],*.swp,*~,.git,*.hi
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html

set tabstop=4
set shiftwidth=4
set incsearch
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set expandtab           " turn a tabs into spaces
set fileformat=unix     " file mode is unix
" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode

" paste mode toggle (needed when using autoindent/smartindent)
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

""""""""""""""""""""""""""""""""""""""
" Misc Plugins
""""""""""""""""""""""""""""""""""""""

" pathogen
call pathogen#infect()
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" ghc-mod and neco-ghc
let $PATH = $PATH . ':' . expand("~/.cabal/bin")

""""""""""""""""""""""""""""""""""""""
" Syntax highlighting and colorscheme
""""""""""""""""""""""""""""""""""""""
syntax on          " enable colors
set hlsearch       " highlight search (very useful!)
set incsearch      " search incremently (search while typing)
set background=dark
let g:zenburn_high_Contrast=1
colors zenburn

" trailing whitespace highlighting
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" crosshair cursor!
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" over 80 columns highlighting
"highlight OverLength ctermbg=red
"match OverLength /\%>80v.\+/
"autocmd BufWinEnter * match OverLength /\%>80v.\+/
"autocmd InsertEnter * match OverLength /\%>80v.\+/
"autocmd InsertLeave * match OverLength /\%>80v.\+/
"autocmd BufWinLeave * call clearmatches()

"""""""""
" macros
"""""""""
let @h = "yypVr" " .rst headers
let @q = "{!}fmt" " reformat paragraphs
let @w = ":%s/\\s+$//" " remove all trailing whitespace
let @c = ":w !pbcopy"  " copy buffer to mac clipboard
:nnoremap <Leader>w :%s/\s\+$//<CR>
:nnoremap <Leader>p :w !pbcopy<CR><CR>
:nnoremap <CR> :noh<CR><CR> " This unsets the 'last search pattern' register by hitting return

""""""""""""""""""""""""""
" filetype specific stuff
""""""""""""""""""""""""""
filetype indent plugin on
if has("autocmd")

    " if bash is sh.
    let bash_is_sh=1

	" change to directory of current file automatically
	" autocmd BufEnter * lcd %:p:h

	" Put these in an autocmd group, so that we can delete them easily.
	augroup mysettings
		au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=2 softtabstop=2 expandtab
		au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab

		" Confirm to PEP8
		au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class

		" Haskell
		"" use ghc functionality for haskell files
		au Bufenter *.hs compiler ghc
		au FileType haskell setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
		"" configure browser for haskell_doc.vim
		let g:haddock_browser = "open"
		let g:haddock_browser_callformat = "%s %s"
	augroup END

	" Always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside
	" an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif


    " JSON syntax
    autocmd BufNewFile,BufRead *.json set ft=javascript

endif " has("autocmd")
