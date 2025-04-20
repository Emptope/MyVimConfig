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

" Git diff signs for airline integration
Plug 'airblade/vim-gitgutter'

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

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
