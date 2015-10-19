call pathogen#infect()
set nocompatible
set backspace=indent,eol,start
filetype plugin indent on
set showcmd
syntax on
colorscheme desert
set expandtab autoindent shiftwidth=2 tabstop=2 softtabstop=2
set laststatus=2
set number
set cursorline
set list listchars=tab:»\ ,trail:·
set guioptions=ac
set synmaxcol=2048

:map  <CR>  i<CR><Esc><RIGHT>
:map  <Space>  i<Space><Esc><RIGHT>

let g:paredit_leader = '<Space>'

" on save, fix all indents and trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8


" <Ctrl-l> normally redraws the screen; this makes it also
" remove any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" make :vs path/to/file.ext and :sp path/to/file.ext do
" the expected thing, i.e., open the file in the newly
" split buffer rather than the original
set splitright
set splitbelow

" Rainbow Parentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" search
set incsearch " search as you type
set hlsearch " highlight all search results
set ignorecase " combo with smartcase
set smartcase " case-insensitive iff entirely lowercase,
" but if you type something camelCased,
" will be case-sensitive
