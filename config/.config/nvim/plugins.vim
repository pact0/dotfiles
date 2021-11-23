" PLUGINS
"######################################################################

call plug#begin('~/.vim/plugged')
" theme
Plug 'gruvbox-community/gruvbox'


Plug 'ggandor/lightspeed.nvim'


Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'romgrk/fzy-lua-native'

Plug 'alexzanderr/nvim-treesitter-statusline'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'MunifTanjim/nui.nvim'
Plug 'p00f/nvim-ts-rainbow'

" git in vim
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'kevinhwang91/nvim-bqf'

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
Plug 'anott03/nvim-lspinstall'
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


"Plug 'tpope/vim-commentary'

" pretty
Plug 'sbdchd/neoformat'

" file tree and comments
"Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdcommenter'
" debugging leader p
Plug 'meain/vim-printer'
Plug 'jiangmiao/auto-pairs' 
" autocomplete and snippets
"Plug 'neoclide/coc-snippets'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'honza/vim-snippets'
Plug 'adelarsq/vim-matchit'

" Pretty start
"Plug 'mhinz/vim-startify'
" pretty start menu
Plug 'glepnir/dashboard-nvim'
" bar
Plug 'hoob3rt/lualine.nvim'

"Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

" segreate python imports
"Plug 'fisadev/vim-isort'

" scientific notation
Plug 'jbyuki/nabla.nvim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" edit jupyter notebooks
Plug 'goerz/jupytext.vim'

" markdown-preview in browser
Plug 'iamcco/markdown-preview.nvim'
"Plug 'lervag/vimtex'

"Switch true to false etc
Plug 'AndrewRadev/switch.vim'

"Plug 'mfussenegger/nvim-dap'
"" Plug 'rcarriga/nvim-dap-ui'
"Plug 'nvim-telescope/telescope-dap.nvim'
"Plug 'theHamsta/nvim-dap-virtual-text'

Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector', {
  \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
  \ }
" ranger in vim
"Plug 'kevinhwang91/rnvimr'
" cs'"
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

Plug 'derekwyatt/vim-fswitch'
Plug 'tyru/open-browser.vim'
Plug 'ilyachur/cmake4vim'
" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'

Plug 'ryanoasis/vim-devicons'
call plug#end()

