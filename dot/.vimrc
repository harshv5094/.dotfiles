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

" Plugins List
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'wombat',
    \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\ }

