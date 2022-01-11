" PLUGINS
"######################################################################

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
" faster startup

Plug 'ahmedkhalf/project.nvim'
Plug 'ldelossa/calltree.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'tweekmonster/startuptime.vim'

" Plug 'numToStr/Navigator.nvim'
" Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'
" Plug 'rebelot/kanagawa.nvim'

" Plug 'mattn/efm-langserver'
Plug 'monaqa/dial.nvim'
Plug 'sQVe/sort.nvim'
" Plug 'folke/zen-mode.nvim'
Plug 'rafamadriz/friendly-snippets'


"theme
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'rigellute/shades-of-purple.vim'
" Plug 'cocopon/iceberg.vim'
" Plug 'rktjmp/lush.nvim'
" Plug 'ray-x/aurora'
" Plug 'ellisonleao/gruvbox.nvim'
" Plug 'mcchrish/zenbones.nvim'
" Plug 'CantoroMC/nvim-nightmare'
Plug 'lambdalisue/suda.vim'
Plug 'romgrk/barbar.nvim'

Plug 'stephpy/vim-php-cs-fixer'

" Project management
" Plug 'airblade/vim-rooter'

Plug 'windwp/nvim-projectconfig'
Plug 'klen/nvim-config-local'
" Plug 'rmagatti/auto-session'
" Plug 'ahmedkhalf/project.nvim'
" Plug 'rmagatti/session-lens'

Plug 'andweeb/presence.nvim'
Plug 'Pocco81/AutoSave.nvim'


"Switch true to false etc
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'ggandor/lightspeed.nvim'
Plug 'vim-scripts/UnconditionalPaste'
Plug 'bkad/CamelCaseMotion'

Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope-cheat.nvim'

" Plug 'gelguy/wilder.nvim'
" Plug 'tami5/telescope-frecency.nvim'
" Plug 'nvim-telescope/telescope-cheat.nvim'
" Plug 'tami5/sqlite.lua'
Plug 'sindrets/diffview.nvim'
" Plug 'pwntester/octo.nvim#-features' -- gh gui
Plug 'tami5/neorg'

Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
Plug 'romgrk/fzy-lua-native'
Plug 'junegunn/fzf'

" Plug 'lukas-reineke/indent-blankline.nvim'

" git in vim
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'rhysd/git-messenger.vim'

Plug 'Shatur/neovim-cmake'
" Plug 'creativenull/efmls-configs-nvim'


" Plug 'numToStr/FTerm.nvim'
Plug 'akinsho/nvim-toggleterm.lua'

" undo tree
Plug 'simnalamburt/vim-mundo'

" Tree shitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'tree-sitter/tree-sitter-cpp'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nvim-neorg/tree-sitter-norg'
Plug 'David-Kunz/treesitter-unit'
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'
" Plug 'spywhere/detect-language.nvim'
Plug 'MDeiml/tree-sitter-markdown'
"auto close html tags
" <div></div>    ciwspan<esc>   <span></span>
Plug 'windwp/nvim-autopairs'
Plug 'MunifTanjim/nui.nvim'
" more text object
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'andymass/vim-matchup'

" paste without newline gcp
Plug 'vim-scripts/UnconditionalPaste'
" inc search
Plug 'haya14busa/incsearch.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

" Plug 'ThePrimeagen/harpoon'

" adds colors #fff

" lsp Plugins
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'glepnir/lspsaga.nvim'

" lsp helpers
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" Plug 'jose-elias-alvarez/null-ls.nvim'
" better quickfix
Plug 'romainl/vim-qf'
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
" Plug 'kevinhwang91/nvim-bqf'
" Plug 'mileszs/ack.vim'
" (a(b)((c)))
" gS gJ
Plug 'AndrewRadev/splitjoin.vim'

" completion
" snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'andersevenrud/cmp-tmux'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'f3fora/cmp-spell'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'lukas-reineke/cmp-under-comparator'
Plug 'lukas-reineke/cmp-rg'

" Plug 'vim-scripts/CmdlineComplete'



" A tree like view for symbols in Neovim using the Language Server Protocol.
" Plug 'simrat39/symbols-outline.nvim'

Plug 'styled-components/vim-styled-components'
Plug 'junegunn/vim-easy-align'
" Plug 'nvim-lua/diagnostic-nvim'


" file tree
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'Shougo/defx.nvim'
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
" Plug 'rbgrouleff/bclose.vim'

" debugging leader p
" Plug 'meain/vim-printer'

" pretty start menu
Plug 'glepnir/dashboard-nvim'

" bar
Plug 'hoob3rt/lualine.nvim'
Plug 'SmiteshP/nvim-gps'

" edit jupyter notebooks
Plug 'goerz/jupytext.vim'

" markdown-preview in browser
Plug 'iamcco/markdown-preview.nvim'


" debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'Pocco81/DAPInstall.nvim'

" tests

Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'


" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()
