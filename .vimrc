" @format

" OPTIONS ------------------------------------------------------------------------------- {{{ 
  " Accessing Vim Internal Clipboard
  set clipboard+=unnamed
 
  " Truecolor support
  set termguicolors

  " Setting colorscheme
  colorscheme default

  " Accessing System Clipboard
  set clipboard=unnamedplus 

	" Enable type file detection. Vim will be able to try to detect the type of file in use.
	filetype on

	" Enable plugins and load plugin for the detected file type.
	filetype plugin on

	" Load an indent file for the detected file type.
	filetype indent on

	" Loading Status Bar
	set laststatus=2
    
  " Setting Autoindent and smartindent
  set autoindent   
  set smartindent

  " Set background to dark
  set background=dark

  " Highlight cursor line underneath the cursor horizontally.
  set cursorline

	" Set shift width to 2 spaces.
  set shiftwidth=2

	" Set tab width to 2 columns.
	set tabstop=2

	" Use space characters instead of tabs.
	set expandtab

	" Do not save backup files.
	set nobackup

	" Do not let cursor scroll below or above N number of lines when scrolling.
	set scrolloff=10

	" Do not wrap lines. Allow long lines to extend as far as the line goes.
	set nowrap

	" While searching though a file incrementally highlight matching characters as you type.
	set incsearch

	" Ignore capital letters during search.
	set ignorecase

	" Override the ignorecase option if searching for capital letters.
	" This will allow you to search specifically for capital letters.
	set smartcase

	" Show partial command you type in the last line of the screen.
	set showcmd

	" Show the mode you are on the last line.
	set showmode

	" Show matching words during a search.
	set showmatch

	" Use highlighting when doing a search.
	set hlsearch

	" Set the commands to save in history default number is 20.
	set history=1000

	" Disable compatibility with vi which can cause unexpected issues.
	set nocompatible

	" Enable line numbers
	set relativenumber

	" Set Syntax On
	syntax on

	" Enable auto completion menu after pressing TAB.
	set wildmenu

	" Make wildmenu behave like similar to Bash completion.
	set wildmode=list:longest

	" There are certain files that we would never want to edit with Vim.
	" Wildmenu will ignore files with these extensions.
	set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" KEYMAPS --------------------------------------------------------------------------------------------------------------------- {{{

	" Pressing the letter o will open a new line below the current one.
	" Exit insert mode after creating a new line above or below the current line.
	nnoremap o o<esc>
	nnoremap O O<esc>

	" Split Window

	nnoremap ss :split<CR>
	nnoremap sv :vsplit<CR>

	" Move Window
	nnoremap sh <C-w>h
	nnoremap sk <C-w>k
	nnoremap sj <C-w>j
	nnoremap sl <C-w>l

	" Resize Window
	nnoremap <C-w><left> <C-w><
	nnoremap <C-w><right> <C-w>>
	nnoremap <C-w><up> <C-w>+
	nnoremap <C-w><down> <C-w>-

  " Tab related Keymaps
  nnoremap te :tabedit<CR>
  nnoremap tc :tabclose<CR>
  nnoremap <Tab> :tabnext<CR>
  nnoremap <S-Tab> :tabprevious<CR>

  " String Replacement
  nnoremap <localleader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left><Left>

  " Changing file to execution
  nnoremap <localleader>x <cmd>!chmod +x %<CR>


" }}}

" PLUGINS ---------------------------------------------------------------- {{{
	" Plugins List
	call plug#begin()

	" For status line
	Plug 'itchyny/lightline.vim'

	" For Git Branch
	Plug 'itchyny/vim-gitbranch'

	" Vim Directory Navigation
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	
	" post install (yarn install | npm install) then load plugin only for editing supported files
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

	call plug#end()

	" Lightline Settings
	let g:lightline = {
      \ 'colorscheme': 'powerline',
  		\ 'active': {
      		\   'left': [ [ 'mode', 'paste' ],
      		\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      	\ },
    	\ 'component_function': {
      		\   'gitbranch': 'FugitiveHead'
      	\ },
	\ }

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}
