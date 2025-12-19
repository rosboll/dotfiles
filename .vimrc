" ==============================================================================
" BASE CONFIGURATION & SOURCING DEFAULTS
" ==============================================================================

" Load Vim's system-wide defaults first (e.g., set nocompatible, set hlsearch,
" mouse support, and basic syntax loading).
source $VIMRUNTIME/defaults.vim

" Enable file type detection, loading relevant plugins, and smart indentation.
filetype plugin indent on

" ==============================================================================
" LINE NUMBERS AND VISUAL AIDS
" ==============================================================================

" Setting both 'number' and 'relativenumber' is a popular combo.
" The current line shows its ABSOLUTE number, and all others are RELATIVE.
set number
set relativenumber

" Highlight the line the cursor is currently on.
set cursorline

" Shows invisible characters (tabs, trailing spaces, etc.) - great for clean code.
" set list

" ==============================================================================
" SEARCHING
" ==============================================================================

" Highlight all matches of the last search pattern.
set hlsearch

" Highlights matches as you type the search pattern (interactive search).
set incsearch

" Case-insensitive search by default.
set ignorecase

" Override ignorecase if search pattern contains uppercase letters.
set smartcase

" ==============================================================================
" TABS AND INDENTATION
" ==============================================================================

" Convert typed tabs into spaces.
set expandtab

" The width of a displayed tab character (if using actual tabs).
set tabstop=4

" The number of spaces used for auto-indent and manual indent commands (>> or <<).
set shiftwidth=4

" ==============================================================================
" GENERAL EDITING ENHANCEMENTS
" ==============================================================================

" Allows you to switch buffers without saving the current one first (changes are kept).
set hidden

" Keeps 8 lines of context above and below the cursor when scrolling.
set scrolloff=8

" Ensure file encoding is set to the widely compatible UTF-8 standard.
set encoding=utf-8
set fileencoding=utf-8

" Better command-line completion with visual menu.
set wildmenu

" Use system clipboard for yank/paste operations.
set clipboard=unnamedplus
