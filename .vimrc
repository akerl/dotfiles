" General {{{
set nocompatible " leave the past behind
" Leader as space
let mapleader = "\<Space>"
" Shortcuts for write/quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :x<CR>
" Toggle paste with F2
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
" Backspace should delete indents and linewrap
set backspace=indent,eol,start
" Set edit history larger than the default
set history=1000
" }}}
" Plugins {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" }}}
" Display {{{
syntax on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Show column at 80 character mark if vim is new enough
if exists('+colorcolumn')
    set colorcolumn=81
endif

" Show line number and relative numbers
set number
set relativenumber
" Use F1 to toggle line numbers
nmap <F1> :set number! relativenumber! relativenumber?<cr>
imap <F1> <C-O>:set number! relativenumber! relativenumber?<cr>
" Use F3 to toggle relative line numbers
nnoremap <F3> :set relativenumber! relativenumber?<cr>
inoremap <F3> <C-O>:set relativenumber! relativenumber?<cr>

" show tab characters as '▸ '
set list
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:+

" Disable neovim cursor styling
set guicursor=

" Delete comment character when joining commented lines
set formatoptions+=j
" }}}
" Indentation {{{
" tabstop is the number of spaces a tab counts for
set tabstop=4
" softabstop is the number of spaces a tab counts for when editing
set softtabstop=4
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" expandtab turns <TAB>s into spaces
set expandtab
" enables use of shiftwidth when inserting tabs
set smarttab
" Copy indent from current line when starting a new line
set autoindent
" Do smart autoindenting when starting a new line
set smartindent
" }}}
" Backups {{{
" Enable backup files and store them in ~/.vim/backup
set backup
set writebackup
set backupdir=~/.vim/swap
" Enable swap files and store them in ~/.vim/swap
set directory=~/.vim/swap
" }}}
" Folding {{{
" Fold based on indent
set foldmethod=indent
" Show 10 folds in by default
set foldlevelstart=10
" Don't nest deeper than 10 levels
set foldnestmax=10
" Use <leader>z to open/close a fold
nnoremap <leader>z za
" }}}
" File Parsing {{{
" Check the first and last 5 lines for modelines that set local vim behavior
set modelines=5
" Enable filetype-based display
filetype plugin indent on
" }}}
" Searching {{{
""""
" Searches are case-insensitive
set ignorecase
" Searches start immediately as you type
set incsearch
" Highlight results
set hlsearch
" Hotkey to turn off persistent highlighting
nnoremap <leader>h :nohlsearch<CR>
" }}}
" Terraform {{{
" Automatically format on save
let g:terraform_fmt_on_save=1
" }}}
" Go {{{
let g:go_template_autocreate = 0
" }}}
" Airline {{{
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" }}}
" vim:foldmethod=marker:foldlevel=0
