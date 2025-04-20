" =========================
" Basic Neovim Settings
" =========================
set number                      " Show line numbers
set relativenumber             " Show relative line numbers
set clipboard=unnamedplus      " Use system clipboard
set mouse=a                    " Enable mouse support
syntax on                      " Enable syntax highlighting
filetype plugin indent on      " Enable filetype detection and plugins
set tabstop=4                  " Number of spaces per tab
set shiftwidth=4               " Indentation size
set expandtab                  " Use spaces instead of tabs
set termguicolors              " Enable true color support
set encoding=utf-8             " Use UTF-8 encoding
set hidden                     " Allow switching buffers without saving
set nowrap                     " Disable line wrap
set signcolumn=yes             " Always show sign column

" =========================
" Plugin Manager: vim-plug
" =========================
call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
Plug 'preservim/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" Git integration
Plug 'tpope/vim-fugitive'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Comment toggling
Plug 'preservim/nerdcommenter'

call plug#end()

" =========================
" Theme
" =========================
colorscheme dracula
let g:airline_theme='dracula'

" =========================
" NERDTree Settings
" =========================
map <C-n> :NERDTreeToggle<CR>             " Toggle NERDTree with Ctrl+N
let NERDTreeShowHidden=1                  " Show hidden files
autocmd VimEnter * NERDTree | wincmd p    " Open NERDTree on startup

" =========================
" CoC (Code Completion)
" =========================
" Use Tab for completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Format on save
autocmd BufWritePre * silent! :CocCommand editor.action.formatDocument

" =========================
" Nerd Commenter Settings
" =========================
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Toggle comment with leader + c
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle
