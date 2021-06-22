"######################################################################
" PLUGINS 
"######################################################################

call plug#begin('~/.vim/plugged')
" theme
Plug 'gruvbox-community/gruvbox'
" git in vim
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'ThePrimeagen/git-worktree.nvim'

" undo tree
Plug 'mbbill/undotree'

" Tree shitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
" lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'anott03/nvim-lspinstall'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tpope/vim-commentary'
" pretty
Plug 'sbdchd/neoformat'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi'
" a
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" debugging leader p 

Plug 'meain/vim-printer'
" autocomplete and snippets
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'adelarsq/vim-matchit'
" Pretty start
Plug 'mhinz/vim-startify'
" bar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" scientific notation 
Plug 'jbyuki/nabla.nvim'

Plug 'goerz/jupytext.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'kevinhwang91/rnvimr'
call plug#end()

