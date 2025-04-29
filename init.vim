" ~/.config/nvim/init.vim

"=======================
" Vim Plugin Manager (vim-plug)
"=======================
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" --- LSP Config ---
Plug 'neovim/nvim-lspconfig'

" --- Autocompletion Setup ---
Plug 'hrsh7th/nvim-cmp'         " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'     " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'       " Buffer completions
Plug 'hrsh7th/cmp-path'         " Path completions
Plug 'hrsh7th/cmp-cmdline'      " Command-line completions
Plug 'L3MON4D3/LuaSnip'         " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " Snippet completions

" --- Plugins ---
Plug 'preservim/nerdtree'             " File explorer
Plug 'vim-airline/vim-airline'        " Statusline
Plug 'vim-airline/vim-airline-themes' " Themes for Airline
Plug 'nvim-tree/nvim-web-devicons'    " Filetype icons
Plug 'ryanoasis/vim-devicons'         " Filetype icons
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'airblade/vim-gitgutter'         " Git diff signs
Plug 'preservim/nerdcommenter'        " Easy commenting

call plug#end()

"=======================
" General Settings
"=======================
set nocompatible              " Use Neovim defaults, not Vi compatible
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
let mapleader=" "             " Map leader key to Space

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Navigate Vim panes/splits
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Terminal Navigation/Mode Switching
" Use Ctrl+\ Ctrl+n to exit terminal mode easily
tnoremap <Esc> <C-\><C-n>
" Note: Your <C-t> mapping was redundant with the above
" tnoremap <C-t> <C-\><C-n> " Original mapping

" Start terminal in the current file's directory
nnoremap <silent> <leader>t :lcd %:p:h<CR>:belowright split \| terminal<CR>i

" Cancel search highlighting
nnoremap <silent> <Esc> :nohlsearch<CR>

"=======================
" NERDTree Config
"=======================
" Open NERDTree if no file is specified when Vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Show hidden files in NERDTree by default
let g:NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close NERDTree window when a file is opened
" let g:NERDTreeQuitOnOpen = 1 " Uncomment if you want this behavior

" Icons require a patched font (Nerd Font)
let g:NERDTreeShowIcons=1 " This might not work reliably without vim-devicons setup, Lua setup is better

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

" Enable whitespace warnings
let g:airline#extensions#whitespace#enabled = 1

" Enable filetype icons
let g:airline#extensions#tabline#fnamemod = ':t'

" Hide Vim's default mode message
set noshowmode

" Set a theme (alternatives: gruvbox, solarized, tomorrow, etc.)
let g:airline_theme = 'dracula'

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
let g:NERDCompactSexyComs = 1   " Use compact syntax `//comment` instead of `// comment`
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
" Default mapping: <leader>c<space> to toggle comment

"=======================
" Fugitive Config (Shortcuts are commands, not config)
"=======================
" :G        - Git status window (or :Git)
" :Gdiff    - Git diff
" :Gblame   - Git blame
" :Gcommit  - Git commit
" :Gpush    - Git push
" :Gpull    - Git pull
" etc.

"=======================
" Colorscheme Activation
"=======================
colorscheme dracula
set background=dark " Ensure background is set for the colorscheme

"=======================
" LSP and Completion
"=======================

" Enable LSP for specific languages

lua << EOF
local lspconfig = require('lspconfig')

-- C/C++
lspconfig.clangd.setup{}

-- Python
lspconfig.pyright.setup{}


EOF

" Setup nvim-cmp

lua << EOF

-- Import required modules
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    -- REQUIRED: configure snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),   -- Scroll docs up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),    -- Scroll docs down
    ['<C-Space>'] = cmp.mapping.complete(),    -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),           -- Abort completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selected item
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP source
    { name = 'luasnip' },   -- Snippet source
  }, {
    { name = 'buffer' },    -- Buffer source
    { name = 'path' }       -- File path source
  })
})
EOF

" Enable true color support
set termguicolors
