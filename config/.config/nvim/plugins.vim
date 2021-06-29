"######################################################################
" PLUGINS 
"######################################################################

call plug#begin('~/.vim/plugged')
" theme
Plug 'gruvbox-community/gruvbox'



" git in vim
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ThePrimeagen/git-worktree.nvim'



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



" lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'anott03/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-commentary'

" pretty
Plug 'sbdchd/neoformat'

" file tree and comments 
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" debugging leader p 
Plug 'meain/vim-printer'
" autocomplete and snippets
"Plug 'neoclide/coc-snippets'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
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

" edit jupyter notebooks
Plug 'goerz/jupytext.vim'

" markdown-preview in browser
Plug 'iamcco/markdown-preview.nvim'

Plug 'tpope/vim-dispatch'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector', {
  \ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
  \ }
" ranger in vim
"Plug 'kevinhwang91/rnvimr'

" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
call plug#end()

