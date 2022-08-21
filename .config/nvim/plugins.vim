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
Plug 'lewis6991/gitsigns.nvim'

" Vim surround. Repeat.vim allows repition of surround shortcuts with .
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Tabular - line up arbritary text
Plug 'godlygeek/tabular'

" vim-easy-align supplment tabular
Plug 'junegunn/vim-easy-align'

" Easy commenting
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

" Indentline
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Easy tmux/vim splits navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope and dependencies/extensions
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'cljoly/telescope-repo.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'airblade/vim-rooter'

Plug 'glepnir/dashboard-nvim'

Plug 'nanozuki/tabby.nvim'

" lsp integration
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()
