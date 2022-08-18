" --------------------------------------------------------------- "
"  VIM PLUG: https://github.com/junegunn/vim-plug                 "
" --------------------------------------------------------------- "

call plug#begin()

" Colours
" Plug 'mhartington/oceanic-next'
" Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Stable version of coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status lne and icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Vim surround. Repeat.vim allows repition of surround shortcuts with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Tabular - line up arbritary text
Plug 'godlygeek/tabular'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-easy-align supplment tabular
Plug 'junegunn/vim-easy-align'

" Easy commenting
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

" Indentline
Plug 'Yggdroot/indentLine'

" Easy tmux/vim splits navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
