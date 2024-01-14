"  VIM PLUG: https://github.com/junegunn/vim-plug                 "
" --------------------------------------------------------------- "

call plug#begin()

" Colours
Plug 'neanias/everforest-nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim'

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
Plug 'lukas-reineke/indent-blankline.nvim'

" Easy tmux/vim splits navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope and dependencies/extensions
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'cljoly/telescope-repo.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" sets the vim working directory to the project root
Plug 'airblade/vim-rooter'

" tabline plugin
Plug 'nanozuki/tabby.nvim'

" Utility for installing lsp packages
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

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

Plug 'liuchengxu/vim-which-key'

" lsp for helm
Plug 'towolf/vim-helm'

" yaml companion
Plug 'someone-stole-my-name/yaml-companion.nvim'

Plug 'williamboman/mason.nvim'

call plug#end()
