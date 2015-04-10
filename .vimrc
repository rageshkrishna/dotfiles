" ConEmu 256 colours for Windows
if has("win32")
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  set guifont=Consolas:h11:cANSI
endif

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
Bundle 'vim-scripts/AnsiEsc.vim.git'

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
let &colorcolumn=join(range(81,81),",")
set listchars=tab:▸\ ,trail:·
set list
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
