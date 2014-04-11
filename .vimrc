set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'

set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
set backspace=indent,eol,start

set hidden
set cursorline
set hlsearch

filetype plugin indent on     " required!

set laststatus=2
colorscheme Tomorrow-Night-Bright
let g:airline#extensions#tabline#enabled = 1

