set nocompatible
filetype off
source $HOME/.config/nvim/plugins.vim
"source $HOME/.config/nvim/coc.vim

" Load plugins and indentation for file types
filetype plugin indent on

" Colours
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
"set background=dark
let g:tokyonight_style='night'
colorscheme tokyonight

" Spaces, tabs and indentation.
set shiftwidth=2    " how many columns indented with << >> operations
set softtabstop=2   " how many columns indented in insert mode
set tabstop=2       " number of spaces inserted on tab with noexpandtab set
set expandtab       " spaces inserted instead of tab character
set autoindent      " Copy indent of last line on new line
set smartindent
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

set autoread        " automatically reread changed files without prompt
set noswapfile
set nobackup

" Use unix file format by default
set fileformats=unix,dos,mac

" Better completion
set completeopt=menu,menuone,noselect

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

" ------------ Terminal ------------- "
augroup nvim_term
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" ----------------------------- "
" Plugin configuration
" ----------------------------- "

" ---------- Better Whitespace ----------- "
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'dashboard']
autocmd BufWritePre * StripWhitespace

" -------------- Lualine ---------------- "
lua << END
  require('lualine').setup {
    options = {
      theme = 'tokyonight'
    }
  }
END

" ------------- Fugitive ---------------- "
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Git push<CR>
vnoremap <leader>gb :Git blame<CR>

" ------------- Treesitter ---------------- "
lua << END
  require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all"
    ensure_installed = { "json", "yaml", "dockerfile", "javascript", "markdown", "typescript", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { },

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- list of language that will be disabled
      -- some conflict with indentline causing quotes to be concealed?
      disable = { "json" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
END

" ------------- Telescope ---------------- "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope repo list<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>

lua << END
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = {
        "^.git/",
        ".DS_Store",
      }
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        find_command = { 'fd', '--type=f', '--ignore', '--hidden' } --
      },
      live_grep = {
        theme = 'dropdown',
      },
      buffers = {
        theme = 'dropdown',
      },
      git_branches = {
        theme = 'dropdown',
      }
    },
    extensions = {
      repo = {
        theme = 'dropdown',
        list = {
          search_dirs = {
            "~/git",
          },
        },
      },
      file_browser = {
        theme = 'dropdown',
        hijack_netrw = true
      }
    },
  }
  require('telescope').load_extension('repo')
  require('telescope').load_extension('file_browser')
END

" ---------------- IndentLine ----------------- "
let g:indentLine_char = '¦'

" ---------------- Git Signs ----------------- "
lua << END
  require('gitsigns').setup {
		signs = {
			add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
			change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
			delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			topdelete    = {hl = 'GitSignsDelete', text = '_¯', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			changedelete = {hl = 'GitSignsChange', text = '~_', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		},
		signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
		numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true
		},
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = 'single',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1
		},
		yadm = {
			enable = false
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map('n', ']c', function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gs.next_hunk() end)
				return '<Ignore>'
			end, {expr=true})

			map('n', '[c', function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gs.prev_hunk() end)
				return '<Ignore>'
			end, {expr=true})

			-- Actions
			map('n', '<leader>gb', function() gs.blame_line{full=true} end)
			map('n', '<leader>tb', gs.toggle_current_line_blame)
			map('n', '<leader>gd', gs.diffthis)
		end
  }
END

" ---------------- VimRooter ----------------- "
"  automatically change the window/tab working directory
let g:rooter_cd_cmd = 'lcd'

" ---------------- Tabby ----------------- "
lua << END
  require('tabby').setup {
    tabline = require('tabby.presets').tab_only,
  }
END

" ---------------- nvim-cmp ------------------- "
lua << END
  -- Setup nvim-cmp.
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })
END

" ---------------- vsnip ------------------- "
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" ---------------- yaml-ls ------------------- "
lua << END
  require('lspconfig').yamlls.setup {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
          ["Kubernetes"] = "/*.k8s.yaml",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yaml",
        },
      },
    }
}
END

" ---------------- pyright-ls ------------------- "
lua << END
  require('lspconfig').pyright.setup{}
END


" ---------------- Dashboard ------------------- "
lua << END
  local db = require('dashboard')
  db.custom_center = {
    {
       icon = ' ',
       desc = 'Find File                      ',
       action = 'Telescope find_files',
       shortcut = 'SPC f f',
    },
    {
       icon = ' ',
       desc = 'Live Grep                      ',
       action = 'Telescope live_grep',
       shortcut = 'SPC f g',
    },
    {
       icon = ' ',
       desc = 'Open Repo                      ',
       action = 'Telescope repo list',
       shortcut = 'SPC f r',
    },
  }
  db.custom_footer = {}
  db.custom_header = {
    \'                 ▄████████▄         ',
    \'               ▄█▀▒▒▒▒▒▒▒▀██▄       ',
    \'           ▄█▀▒▒▒▒▒▒▄▒▒▒▒▒▒▐█▌      ',
    \'         ▄█▒▒▒▒▒▒▒▒▒▒▀█▒▒▒▄██       ',
    \'       ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▀▒▒▒█▄     ',
    \'     ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▄   ',
    \'     ▄█▒▒▒▄██████▄▒▒▒▒▄█████▄▒▒▒▒█  ',
    \'     █▒▒▒█▀░░░░░▀█ ▒▒▒█▀░░░░▀█▒▒▒█  ',
    \'     █▒▒▒█░░▄░░░░▀████▀░░░▄░░█▒▒▒█  ',
    \'   ▄███▄▒█▄░▐▀▄░░░░░░░░░▄▀▌░▄█▒▒███▄',
    \'   █▀░░█▄▒█░▐▐▀▀▄▄▄ ▄▄▄▀▀▌▌░█▒▒█░░▀█',
    \'   █░░░░█▒█░▐▐  ▄▄ █ ▄▄  ▌▌░█▒█░░░░█',
    \'   █░▄░░█▒█░▐▐▄ ▀▀ █ ▀▀ ▄▌▌░█▒█░░▄░█',
    \'   █░░█░█▒█░░▌▄█▄▄▀ ▀▄▄█▄▐░░█▒█░█░░█',
    \'   █▄░█████████▀░░▀▄▀░░▀█████████░▄█',
    \'   ██▀░░▄▀░░▀░░▀▄░░░▄▀░░▀░░▀▄░░▀██  ',
    \'   ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██',
    \'   █░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░▄░█',
    \'   █░▀█▄░░░░░░░░░░░░░░░░░░░░░░░▄█▀░█',
    \'   █░░█▀███████████████████████▀█░░█',
    \'   █░░█    █   █   █   █   █    █░░█',
    \'   █░░░▀█▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄█▀░░░█',
    \'   ▀█░░▀█▄█    █   █   █   █▄█▀░░░█▀  ',
    \'    ▀█░░░▀▀█▄▄ █   █   █▄▄█▀▀░░░░█▀  ',
    \'     ▀█░░░░░▀▀█████████▀▀░░░░░░█▀    ',
    \'      ▀█░░░░░░░▄░░░░░░░▄░░░░░░█▀    ',
    \'        ▀██▄░░░▀▀▀▀▀▀▀▀▀░░░▄██▀      ',
    \'          ▀██▄▄░░░░░░░▄▄██▀        ',
    \'             ▀▀███████▀▀            ',
  }
END
