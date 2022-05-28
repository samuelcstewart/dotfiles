" --------------------------------------------------------------- "
"  VIM PLUG: https://github.com/junegunn/vim-plug                 "
" --------------------------------------------------------------- "

call plug#begin()

" Colours
" Plug 'mhartington/oceanic-next'
Plug 'sainnhe/everforest'

" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status lne and icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Git utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
"Plug 'sirver/ultisnips'

" Vim surround. Repeat.vim allows repition of surround shortcuts with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Tabular - line up arbritary text
Plug 'godlygeek/tabular'


"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-easy-align supplment tabular
Plug 'junegunn/vim-easy-align'

" Easy commenting
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

Plug 'andrewstuart/vim-kubernetes'

" Generate colours for tmuxline based on vim colours
Plug 'edkolev/tmuxline.vim'

" Indentline
Plug 'Yggdroot/indentLine'
call plug#end()
