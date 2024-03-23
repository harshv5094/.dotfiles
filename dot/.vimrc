" OPTIONS ------------------------------------------------------------------------------- {{{ 

	" Disable compatibility with vi which can cause unexpected issues.
	set nocompatible

	" Enable type file detection. Vim will be able to try to detect the type of file in use.
	filetype on

	" Enable plugins and load plugin for the detected file type.
	filetype plugin on

	" Load an indent file for the detected file type.
	filetype indent on

	" Loading Status Bar
	set laststatus=2

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

" }}}

" PLUGINS ---------------------------------------------------------------- {{{
	" Plugins List
	call plug#begin()

	" For status line
	Plug 'itchyny/lightline.vim'

	" For Git Branch
	Plug 'itchyny/vim-gitbranch'

	" For Code Completion
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }

	" Vim Directory Navigation
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

	call plug#end()

	" Lightline Settings
	let g:lightline = {
      			\ 'colorscheme': 'wombat',
  			\ 'active': {
      			\   'left': [ [ 'mode', 'paste' ],
      			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      			\ },
    			\ 'component_function': {
      			\   'gitbranch': 'FugitiveHead'
      		\ },
	\ }

	" NerdTree Settings
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap sf :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>

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

