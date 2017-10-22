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
Plug 'dracula/vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntastic
" Plug 'scrooloose/syntastic'

" Git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
" Plug 'sirver/ultisnips'
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
Plug 'sheerun/vim-polyglot', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Render markdown live in browser. See GitHub for further setup instructions
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Easy comments
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Load plugins and indentation for file types
filetype plugin indent on

" Colours
color dracula

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

" UI
set number          " show line numbers
set showcmd         " show last command entered
set cursorline      " highlight current line
set wildmenu        " visual autocomplete menu
set showmatch       " highlight matching parenthesis etc
set mouse=a         " enable mouse in all modes where supported
set laststatus=2    " always display status line in all windows
set noshowmode      " hide default mode text --INSERT-- Shows in Powerline
set nrformats=		  " treat all numbers as decimal, not octal
set scrolloff=10    " always display 10 lines above and below cursor
set ruler           " show line number in status bar
"set clipboard=unnamed

" Use unix file format by default
set fileformat=unix

" Allow navigation away from changed buffers without bang
set hidden

" Natural splits
set splitbelow
set splitright

" Searching
set incsearch       " show where search pattern matches, as typed so far
set hlsearch        " highlight search matches


" Case sensitivity
"
" ignore case turns off case sensitivity in pattern matching. Smart case
" matches all patterns if the string is all lowercase. If the string contains
" upper case characters, it will perform a case sensitive search.
" Use \c and \C to override, insensitive/sensitive respectively.
set ignorecase
set smartcase

" Syntastic
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" Airline
let g:airline_powerline_fonts=1                   " use patched powerline fonts (flash symbols)

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

"""" Key mappings

" Leader
let mapleader=","   " change default \ leader to ,

" Clear search highlights
nnoremap <leader><space> :nohlsearch<CR> " clear search highlighting

" Key mappings for CtrlP. Use secondary keystroke to open certain mode.
nnoremap <C-p>f :CtrlP <CR>                   " Open CtrlP in File mode
nnoremap <C-p>b :CtrlPBuffer <CR>             " Open CtrlP in Buffer mode
nnoremap <C-p>t :CtrlPTag <CR>                " Open CtrlP in Tag mode

" Easy split navigation (normal mode only)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" UltiSnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Whitespace
highlight TrailingWhiteSpace ctermbg=19 guibg=#4f5b66
nnoremap <Leader>dw :%s/\s\+$//e<CR>            " Delete all trailing whitespace in current buffer
match TrailingWhiteSpace /\s\+$/                " Match trailing whitespace

" Folding
let g:vim_markdown_folding_disabled = 1

nnoremap <Space> za
vnoremap <Space> za

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Indent guides
"let g:indent_guides_auto_colors=0

" When in insert mode, matches all trailing whitespace not at the end of the current line
" Stops annoying highlights when spacing and tabbing at the end of the current line.
augroup augroup_whitespace
  autocmd!
  autocmd InsertEnter * match TrailingWhiteSpace /\s\+\%#\@<!$/
  autocmd InsertLeave * match TrailingWhiteSpace /\s\+$/
augroup END

" Auto command group for setting options per filetype
augroup augroup_filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown         " by default vim7.4 uses modulo2 on .md extensions?
  autocmd BufRead,BufNewFile *.pp set filetype=puppet
  autocmd FileType markdown
        \ setlocal nolinebreak |
        \ setlocal wrapmargin=0 |
        \ setlocal spell spelllang=en_nz
  autocmd FileType python
        \ setlocal shiftwidth=4 |
        \ setlocal softtabstop=4 |
        \ setlocal tabstop=8 |
        \ setlocal textwidth=79 |
        \ setlocal expandtab |
        \ setlocal autoindent |
        \ setlocal colorcolumn=80
  autocmd FileType php
        \ setlocal shiftwidth=4 |
        \ setlocal softtabstop=4 |
        \ setlocal tabstop=4 |
        \ setlocal expandtab |
        \ setlocal autoindent
augroup END