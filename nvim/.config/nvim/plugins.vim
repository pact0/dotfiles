" PLUGINS
"######################################################################

call plug#begin('~/.vim/plugged')

" faster startup
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'

Plug 'numToStr/Navigator.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'mattn/efm-langserver'


"theme
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'


"Switch true to false etc
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'
Plug 'ggandor/lightspeed.nvim'
Plug 'vim-scripts/UnconditionalPaste'
Plug 'bkad/CamelCaseMotion'

Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'romgrk/fzy-lua-native'
Plug 'junegunn/fzf'

Plug 'lukas-reineke/indent-blankline.nvim'

" git in vim
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'rhysd/git-messenger.vim'



Plug 'numToStr/FTerm.nvim'
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
Plug 'David-Kunz/treesitter-unit'
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'
Plug 'spywhere/detect-language.nvim'
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

Plug 'ThePrimeagen/harpoon'

" adds colors #fff
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" lsp Plugins
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'glepnir/lspsaga.nvim'

" lsp helpers
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" Plug 'jose-elias-alvarez/null-ls.nvim'
" better quickfix
Plug 'romainl/vim-qf'
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
Plug 'kevinhwang91/nvim-bqf' 
Plug 'mileszs/ack.vim'

" gS gJ
Plug 'AndrewRadev/splitjoin.vim'

" completion
" snippets
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'andersevenrud/compe-tmux'
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
Plug 'vim-scripts/CmdlineComplete'



" A tree like view for symbols in Neovim using the Language Server Protocol.
" Plug 'simrat39/symbols-outline.nvim'

Plug 'styled-components/vim-styled-components'
Plug 'nvim-lua/diagnostic-nvim'


" file tree 
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'francoiscabrol/ranger.vim'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'rbgrouleff/bclose.vim'

" debugging leader p
Plug 'meain/vim-printer'

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
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'


" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

