" PLUGINS
"######################################################################

call plug#begin('~/.vim/plugged')
Plug 'numToStr/Navigator.nvim'
Plug 'numToStr/Comment.nvim'

Plug 'Shatur/neovim-cmake'
Plug 'mattn/efm-langserver'

Plug 'lukas-reineke/format.nvim'
" Navigator
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'

" register management
Plug 'AckslD/nvim-neoclip.lua'

"auto close html tags
Plug 'windwp/nvim-ts-autotag'
"theme
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'


Plug 'ggandor/lightspeed.nvim'


Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'romgrk/fzy-lua-native'


Plug 'alexzanderr/nvim-treesitter-statusline'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tree-sitter/tree-sitter-cpp'
Plug 'MunifTanjim/nui.nvim'
Plug 'p00f/nvim-ts-rainbow'

" git in vim
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'kevinhwang91/nvim-bqf'


Plug 'numToStr/FTerm.nvim'
Plug 'akinsho/nvim-toggleterm.lua'

" undo tree
Plug 'mbbill/undotree'

" Tree shitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" telescope
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

Plug 'ThePrimeagen/harpoon'
"Plug 'unblevable/quick-scope'  

" adds colors #fff
Plug 'norcalli/nvim-colorizer.lua'

" lsp Plugins
Plug 'neovim/nvim-lspconfig'
" Plug 'anott03/nvim-lspinstall'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'glepnir/lspsaga.nvim'


Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'hrsh7th/vim-vsnip-integ'

Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'

Plug 'styled-components/vim-styled-components'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'nvim-lua/diagnostic-nvim'


" pretty
Plug 'sbdchd/neoformat'

" file tree and comments
Plug 'kyazdani42/nvim-tree.lua'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" debugging leader p
Plug 'meain/vim-printer'
Plug 'jiangmiao/auto-pairs' 
" autocomplete and snippets
"Plug 'neoclide/coc-snippets'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'
Plug 'adelarsq/vim-matchit'

" pretty start menu
Plug 'glepnir/dashboard-nvim'

" bar
Plug 'hoob3rt/lualine.nvim'

" scientific notation
Plug 'jbyuki/nabla.nvim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" edit jupyter notebooks
Plug 'goerz/jupytext.vim'

" markdown-preview in browser
Plug 'iamcco/markdown-preview.nvim'

"Switch true to false etc
Plug 'AndrewRadev/switch.vim'

" debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'

" tests
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'

" surround
Plug 'machakann/vim-sandwich'

Plug 'derekwyatt/vim-fswitch'
Plug 'tyru/open-browser.vim'
Plug 'ilyachur/cmake4vim'


" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

