" Enable Vim-specific features and improved functionality.
set nocompatible  

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Enable relative line numbering mode.
set relativenumber

" Always show the status line at the bottom.
set laststatus=2

" This configuration makes backspace behave more reasonably so that you can
" backspace over anything.
set backspace=indent,eol,start

" Allow switching between buffers without saving changes.
set hidden

" Case-insensitive search unless query contains capital letters.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. 
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Convert Tab to space in Python.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Set autoindent on.
set autoindent
set smartindent
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent

" Begin Plugins
call plug#begin('~/.vim/plugged')

" Colorscheme Plugins
Plug 'tomasr/molokai'

" End Plugins
call plug#end()

" Set the colorscheme.
syntax on
colorscheme molokai
set background=dark

" Preserve original functionality
nnoremap <leader>H H
nnoremap <leader>L L

" Map H to jump to the beginning of the line
nnoremap H 0

" Map L to jump to the end of the line
nnoremap L $

" F5 key: Compile and run the current C++ file
nnoremap <F5> :w<CR>:!g++ -o output % && ./output<CR>
