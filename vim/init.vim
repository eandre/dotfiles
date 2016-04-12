call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/vim-go'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'ChrisKempson/Tomorrow-Theme', {'rtp': 'vim/'}

if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-go', {'do': 'make'}
else
	Plug 'Shougo/neocomplete.vim'
	Plug 'Shougo/vimproc.vim', {'do': 'make'}
endif

call plug#end()

" Make vim usable again (these are default on NeoVim)
if !has('nvim')
	set nocompatible
	filetype off
	filetype plugin indent on

	set ttyfast
	set ttymouse=xterm2
	set ttyscroll=3

	set laststatus=2
	set encoding=utf-8              " Set default encoding to UTF-8
	set autoread                    " Automatically reread changed files without asking me anything
	set autoindent                  
	set backspace=indent,eol,start  " Makes backspace key more powerful.
	set incsearch                   " Shows the match while typing
	set hlsearch                    " Highlight found searches
endif

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set nocursorcolumn
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set background=dark
silent! colorscheme Tomorrow-Night


" Set up a custom leader, so we actually use it
let mapleader=","
let maplocalleader=";"


" Use ctrl-<direction> to move between windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
if has('nvim')
	" Hack to get C-h working in neovim
	map <BS> <C-W>h
endif


" Leader keybinds
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>


" Customizations for vim-go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap gd <Plug>(go-def)
let g:go_fmt_command = "goimports"
