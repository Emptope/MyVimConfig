"=======================
" Vim Plugin Manager
"=======================
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

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

"======================
" CoC Config
"======================

" Use Tab to trigger completion or navigate the completion menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>" :
      \ coc#refresh()

" Use Enter to confirm selection or insert newline
inoremap <silent><expr> <CR>
      \ pumvisible() ? coc#pum#confirm() :
      \ "\<CR>"

" Use Shift+Tab to navigate up in the menu
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Helper function to check for backspace
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show documentation in a floating window when hovering over a symbol.
" Press 'K' in normal mode to trigger this (when cursor is on a symbol).
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! <SID>show_documentation()
  " Check if the filetype is vim or help, in which case use built-in help
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " Otherwise, use coc.nvim to show documentation (LSP hover)
    call CocActionAsync('doHover')
  endif
endfunction

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

" Highlight the symbol under the cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Configure diagnostic signs (errors, warnings) appearance (optional)
" let g:coc_sign_error = '>>'
" let g:coc_sign_warning = '>>'
" let g:coc_sign_info = '>>'
" let g:coc_sign_hint = '>>'

" --- More Advanced coc.nvim Configurations (Optional) ---
" Refer to :h coc-configuration and the documentation of specific coc extensions
" for comprehensive configuration options.

" Example: Hide the commandline message when completion popup is visible
" set shortmess+=c

" Example: Configure specific language servers (advanced)
" let g:coc_language_server_module_path = {
"   \ 'pylsp': expand('~/.pyenv/versions/your_env/bin/pylsp'),
"   \ }

" Dracula Theme Settings in CoC
highlight Pmenu      guibg=#282a36 guifg=#f8f8f2 ctermbg=235 ctermfg=255
highlight PmenuSel   guibg=#44475a guifg=#50fa7b ctermbg=238 ctermfg=84
highlight PmenuKind  guifg=#8be9fd guibg=NONE
highlight PmenuExtra guifg=#bd93f9 guibg=NONE
highlight PmenuSbar  guibg=#44475a
highlight PmenuThumb guibg=#6272a4

augroup CocPopupColors
  autocmd!
  autocmd ColorScheme * call s:custom_coc_colors()
augroup END

function! s:custom_coc_colors() abort
  highlight Pmenu      guibg=#282a36 guifg=#f8f8f2 ctermbg=235 ctermfg=255
  highlight PmenuSel   guibg=#44475a guifg=#50fa7b ctermbg=238 ctermfg=84
  highlight PmenuKind  guifg=#8be9fd guibg=NONE
  highlight PmenuExtra guifg=#bd93f9 guibg=NONE
  highlight PmenuSbar  guibg=#44475a
  highlight PmenuThumb guibg=#6272a4
endfunction
