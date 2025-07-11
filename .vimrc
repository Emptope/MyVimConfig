"=======================
" Vim Plugin Manager
"=======================
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'ghifarit53/tokyonight-vim'

" Add the autocompletion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorer
Plug 'preservim/nerdtree'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Filetype icons
Plug 'ryanoasis/vim-devicons'

" Git integration
Plug 'tpope/vim-fugitive'

" Git diff signs for airline integration
Plug 'airblade/vim-gitgutter'

" Easy commenting
Plug 'preservim/nerdcommenter'

call plug#end()

"=======================
" General Settings
"=======================

set nocompatible             " Nocompatible with old version
syntax on                     " Enable syntax highlighting
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set mouse=a                   " Enable mouse support in all modes
set clipboard=unnamedplus     " Use system clipboard
set encoding=utf-8            " Set default encoding to UTF-8
set fileformat=unix           " Use Unix line endings
set tabstop=4                 " Number of spaces a <Tab> counts for
set shiftwidth=4              " Size of an indent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Insert indents automatically
set autoindent                " Copy indent from current line when starting a new line
set cursorline                " Highlight the current line
set hidden                    " Allow buffer switching without saving
set wildmenu                  " Enhanced command-line completion
set noswapfile                " Disable swap files
set termguicolors             " Enable 24-bit RGB color in the TUI
filetype plugin indent on     " Enable filetype detection, plugins, and indentation

"=======================
" Key Mappings
"=======================

" Map leader to space
let mapleader=" "

" Use <C-n> and <C-p> to navigate the completion suggestion popup menu
" Check if the popup menu is visible before mapping these keys
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<up>"

" Use <CR> (Enter key) to confirm the selected completion item when the popup is visible.
" If the popup is not visible, <CR> will insert a newline as normal.
inoremap <silent><expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

" Toggle NERDTree with F2
nnoremap <F2> :NERDTreeToggle<CR>

" Scroll in integrated terminal
tnoremap <C-t> <C-\><C-n>

" Start terminal at current folder
nnoremap <leader>t :cd %:p:h \| belowright terminal<CR>

"=======================
" Colorscheme Activation
"=======================
colorscheme tokyonight

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

set background=dark

"=======================
" NERDTree Config
"=======================

" Open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Show icons in NERDTree
let g:NERDTreeShowIcons=1

"=======================
" Airline Config
"=======================

" Enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Enable powerline font support
let g:airline_powerline_fonts = 1

" Show Git branch
let g:airline#extensions#branch#enabled = 1

" Show Git diff info
let g:airline#extensions#hunks#enabled = 1

" Disable whitespace warnings
let g:airline#extensions#whitespace#enabled = 0

" Enable filetype icons
let g:airline#extensions#tabline#fnamemod = ':t'

" Hide Vim's default mode message
set noshowmode

" Set a theme (alternatives: gruvbox, solarized, tomorrow, etc.)
let g:airline_theme = 'tokyonight'

" Customize statusline sections
let g:airline_section_y = '%{&filetype}'
let g:airline_section_z = '%l:%c [%p%%]'

" Use <leader>1~9 to jump to tab 1~9
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" <leader>- to previous tab
nmap <leader>- <Plug>AirlineSelectPrevTab

" <leader>+ to next tab
nmap <leader>+ <Plug>AirlineSelectNextTab

" <leader>q to exit current tab
nmap <leader>q :bp<CR>:bd #<CR>

"=======================
" NERDCommenter Config
"=======================

" Use compact syntax for toggled comments
let g:NERDCompactSexyComs = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use <leader>c<space> to toggle comments

"======================
" CoC Config
"======================

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" Add global coc.nvim extensions.
" Need to install these extensions *inside* Vim/Neovim
" by running :CocInstall <extension-name> after :PlugInstall.

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml'
  \ ]

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Completion with tab
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Documentation
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight on hold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Format
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocActionAsync('format')

" Code Actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction-cursor)
nmap <leader>as <Plug>(coc-codeaction-source)
nmap <leader>qf <Plug>(coc-fix-current)

" Refactor
nmap <leader>re <Plug>(coc-codeaction-refactor)
xmap <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <leader>r  <Plug>(coc-codeaction-refactor-selected)

" CodeLens
nmap <leader>cl <Plug>(coc-codelens-action)

" Selection Ranges
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" CoCList bindings
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Import
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
