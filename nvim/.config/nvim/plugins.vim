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
Plug 'folke/which-key.nvim'

Plug 'folke/todo-comments.nvim'

Plug 'monaqa/dial.nvim'
Plug 'rafamadriz/friendly-snippets'



Plug 'lambdalisue/suda.vim'

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
Plug 'ggandor/lightspeed.nvim'
Plug 'vim-scripts/UnconditionalPaste'
Plug 'bkad/CamelCaseMotion'

Plug 'tami5/sqlite.lua'


Plug 'romgrk/fzy-lua-native'
Plug 'junegunn/fzf'

" Plug 'lukas-reineke/indent-blankline.nvim'

" git in vim
Plug 'tpope/vim-fugitive'

Plug 'Shatur/neovim-cmake'


Plug 'akinsho/nvim-toggleterm.lua'

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

" paste without newline gcp
Plug 'vim-scripts/UnconditionalPaste'
" inc search
Plug 'haya14busa/incsearch.vim'


" lsp Plugins
Plug 'RishabhRD/popfix'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'folke/lsp-colors.nvim'

" lsp helpers
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" Plug 'jose-elias-alvarez/null-ls.nvim'
" better quickfix
Plug 'romainl/vim-qf'
Plug 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
" Plug 'kevinhwang91/nvim-bqf'

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


Plug 'styled-components/vim-styled-components'
" Plug 'junegunn/vim-easy-align'


" pretty start menu
Plug 'glepnir/dashboard-nvim'

" bar
Plug 'hoob3rt/lualine.nvim'
Plug 'SmiteshP/nvim-gps'

" tests

Plug 'tpope/vim-dispatch'

call plug#end()
