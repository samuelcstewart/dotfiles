set nocompatible
filetype off
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc.vim

" Load plugins and indentation for file types
filetype plugin indent on

" Colours
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
set background=dark
let g:everforest_background='hard'
colorscheme everforest

" Spaces, tabs and indentation.
set shiftwidth=2    " how many columns indented with << >> operations
set softtabstop=2   " how many columns indented in insert mode
set tabstop=2       " number of spaces inserted on tab with noexpandtab set
set expandtab       " spaces inserted instead of tab character
set autoindent      " Copy indent of last line on new line
set shiftround      " round indent to multiple of shiftwidth
set smarttab        " insert blanks when used infront of line

" UI
set number          " show line numbers
set showcmd         " show last command entered
set cursorline      " highlight current line
set wildmenu        " visual autocomplete menu
set showmatch       " highlight matching parenthesis etc
set mouse=a         " enable mouse in all modes where supported
set laststatus=2    " always display status line in all windows
set noshowmode      " hide default mode indicator
set nrformats=		  " treat all numbers as decimal, not octal
set scrolloff=10    " always display 10 lines above and below cursor
set ruler           " show line number in status bar

" Use unix file format by default
set fileformats=unix,dos,mac

" Allow navigation away from changed buffers without bang
set hidden

" Natural splits
set splitbelow
set splitright

" Searching
set incsearch       " show where search pattern matches, as typed so far
set hlsearch        " highlight search matches

" Search case sensitivity
set ignorecase
set smartcase

" open help vertically
" command! -nargs=* -complete=help Help vertical belowright help <args>
" autocmd FileType help wincmd L

" Translate frequently typoed commands
command! -bang -complete=file -nargs=? E e<bang> <args>
command! -bang -complete=file -nargs=? W w<bang> <args>
command! -bang -complete=file -nargs=? WQ wq<bang> <args>
command! -bang -complete=file -nargs=? Wq wq<bang> <args>
command! -bang Q q<bang>
command! -bang Qa qa<bang>
command! -bang QA qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>

" Encoding
set termencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start  " backspace over everything

" Vim only uses swap files on unix, and not when using sudo. Maintain these in their own directory.
if !strlen($SUDO_USER) && has('unix')
  set swapfile
  set directory^=~/.vim/swap/
  " Create swap directory if not exists
  if !isdirectory($HOME . '/.vim/swap')
    call mkdir($HOME . '/.vim/swap', 'p', 0700)
  endif
else
  set noswapfile
endif

" Repeat timeout to half a second
set timeoutlen=500

" Leader
let mapleader=","   " change default \ leader to ,

" Clear search highlights
nnoremap <leader><space> :nohlsearch<CR> " clear search highlighting

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Easy split navigation (normal mode only)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Strip Whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>

" Fold toggling
nnoremap <Space> za
vnoremap <Space> za

" easily navigate split lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" ---------------------------------- "
"  Filetype
" ---------------------------------- "

au BufRead,BufNewFile *.md,*.mkd,*.markdown,*.mdx set filetype=markdown

au FileType go setlocal noet ts=4 sw=4 sts=4
au FileType markdown setlocal et ts=2 sw=2 nolinebreak wrapmargin=0 spell spelllang=en_nz
au FileType markdown let b:coc_suggest_disable = 1
au FileType python setlocal et sts=4 ts=8 sw=4 textwidth=79 autoindent colorcolumn=80

au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" ----------------------------- "
" Plugin configuration
" ----------------------------- "

" ---------------- CtrlP ----------------- "

" ---------- Better Whitespace ----------- "
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * StripWhitespace

" -------------- Airline ---------------- "
"let g:airline_powerline_fonts=1                   " use patched powerline fonts (flash symbols)
"
lua << END
  require('lualine').setup()
  options = {
    theme = 'everforest'
  }
END

" ------------- Fugitive ---------------- "
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
vnoremap <leader>gb :Git blame<CR>
