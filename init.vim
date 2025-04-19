"=======================
" Vim Plugin Manager
"=======================
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" File explorer
Plug 'preservim/nerdtree'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Filetype icons
Plug 'ryanoasis/vim-devicons'

" Git integration
Plug 'tpope/vim-fugitive'

" Easy commenting
Plug 'preservim/nerdcommenter'

call plug#end()

"=======================
" General Settings
"=======================

set nocompatible             " Nocompatible with old version
syntax on                    " Enable syntax highlighting
set number                   " Show line numbers
set relativenumber           " Show relative line numbers
set mouse=a                  " Enable mouse support
set clipboard=unnamedplus    " Use system clipboard
set encoding=utf-8
set tabstop=4                " Tab = 4 spaces
set shiftwidth=4             " Auto-indent = 4 spaces
set expandtab                " Convert tabs to spaces
set smartindent              " Smart indentation
set autoindent               " Automatic indentation
set cursorline               " Highlight the current line
set hidden                   " Allow buffer switching without saving
set wildmenu                 " Tab-completion in command mode
set noswapfile               " Disable swap files
filetype plugin indent on    " Enable filetype detection and indentation

"=======================
" Key Mappings
"=======================

" Map leader to space
let mapleader=" "

" Toggle NERDTree with F2
nnoremap <F2> :NERDTreeToggle<CR>

"=======================
" NERDTree Config
"=======================

" Open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Quit Vim if the only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && &filetype == "nerdtree") | quit | endif

" Show icons in NERDTree
let g:NERDTreeShowIcons=1

"=======================
" Airline Config
"=======================

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

"=======================
" NERDCommenter Config
"=======================

" Use compact syntax for toggled comments
let g:NERDCompactSexyComs = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use <leader>c<space> to toggle comments

"=======================
" Fugitive Shortcuts
"=======================

" :G       - Git status
" :Gdiff   - Git diff
" :Gblame  - Git blame
