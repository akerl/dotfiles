set nocompatible " leave the past behind
" Terminal settings {{{
""""
" Set keyboard for xterm support of number keys
if &term=="xterm" || &term=="xterm-color"
    set t_Co=8
    set t_Sb=^[4%dm
    set t_Sf=^[3%dm
    :imap <Esc>Oq 1
    :imap <Esc>Or 2
    :imap <Esc>Os 3
    :imap <Esc>Ot 4
    :imap <Esc>Ou 5
    :imap <Esc>Ov 6
    :imap <Esc>Ow 7
    :imap <Esc>Ox 8
    :imap <Esc>Oy 9
    :imap <Esc>Op 0
    :imap <Esc>On .
    :imap <Esc>OQ /
    :imap <Esc>OR *
    :imap <Esc>Ol +
    :imap <Esc>OS -
endif

" Adjust vim timeouts so that commands aren't delayed as long
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
" }}}
" Core Keys {{{
""""
" Leader as space
let mapleader = "\<Space>"
" Shortcuts for write/quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :x<CR>
" }}}
" Display {{{
""""
" Set solarized theme
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
" Adjust selection highlight color
highlight Visual ctermbg=Black ctermfg=Cyan
" Show syntax highlighting
syntax on
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
set listchars=tab:▸\  
" Send more actions at once, suitable for fast systems
set ttyfast
" Redraw less often
set lazyredraw
" }}}
" Input {{{
""""
" Toggle paste with leader+x or F2 (for insert mode)
nnoremap <leader>x :set invpaste paste?<cr>
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
" Backspace should delete indents and linewrap
set backspace=indent,eol,start
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
" Indentation {{{
""""
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
""""
" Enable backup files and store them in ~/.vim/backup
set backup
set writebackup
set backupdir=~/.vim/swap
" Enable swap files and store them in ~/.vim/swap
set directory=~/.vim/swap
" }}}
" Folding {{{
""""
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
""""
" Check the first and last 5 lines for modelines that set local vim behavior
set modelines=5
" Enable filetype-based display
filetype plugin indent on
" Detect indentation for tabs vs spaces
autocmd BufReadPost * :DetectIndent
" Handle Makefiles with hard tabs
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab nolist
" Use markdown for .md files
autocmd BufRead,BufNewFile *.md set filetype=markdown
" }}}
" Plugins {{{
""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'honza/dockerfile.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/DetectIndent'
Plugin 'rodjek/vim-puppet'
Plugin 'fatih/vim-go'
call vundle#end()
" }}}
" DetectIndent {{{
""""
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
" }}}
" Airline {{{
""""
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}
" vim:foldmethod=marker:foldlevel=0
