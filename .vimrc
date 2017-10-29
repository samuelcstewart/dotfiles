set nocompatible

" when using fish, tell vim to use sh.
if &shell =~# 'fish$'
  set shell=sh
endif

filetype off

" --------------------------------------------------------------- "
"  VIM PLUG: https://github.com/junegunn/vim-plug                 "
" --------------------------------------------------------------- "

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/plugged'
  execute '!mkdir -p ~/.vim/autoload'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colours
" Plug 'chriskempson/base16-vim'
" Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntastic
" Plug 'scrooloose/syntastic'

" Git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Vim surround. Repeat.vim allows repition of surround shortcuts with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Tabular - line up arbritary text
Plug 'godlygeek/tabular'

" CtrlP fuzzy file/buffer/tag finder
Plug 'ctrlpvim/ctrlp.vim'

" Indentation guides
Plug 'nathanaelkane/vim-indent-guides'

" Polyglot syntax/indentation files for many languages
Plug 'sheerun/vim-polyglot'

" Vim-go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

" Render markdown live in browser. See GitHub for further setup instructions
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Easy comments
Plug 'scrooloose/nerdcommenter'

" Better whitespace
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" Load plugins and indentation for file types
filetype plugin indent on

" Colours
colorscheme nord

"if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  "source ~/.vimrc_background
"endif

" colorscheme bg doesn't override transparency
hi Normal guibg=NONE ctermbg=NONE

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
"set clipboard=unnamed

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
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

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

au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown

au FileType go setlocal noet ts=4 sw=4 sts=4
au FileType markdown setlocal et ts=2 sw=2 nolinebreak wrapmargin=0 spell spelllang=en_nz
au FileType python setlocal et sts=4 ts=8 sw=4 textwidth=79 autoindent colorcolumn=80

" ----------------------------- "
" Plugin configuration
" ----------------------------- "

" ---------------- CtrlP ----------------- "

" ---------- Better Whitespace ----------- "
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * StripWhitespace

" ------------- UltiSnips ---------------- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -------------- Polyglot --------------- "
let g:vim_markdown_folding_disabled = 1   " do not autofold markdow

" ------------- Syntastic --------------- "
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" -------------- Airline ---------------- "
let g:airline_powerline_fonts=1                   " use patched powerline fonts (flash symbols)

" ------------- Fugitive ---------------- "
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" -------------- Vim-Go ----------------- "
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "ultisnips"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

" -------------- Deoplete -------------- "
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif
