
let mapleader = " "

source $HOME/.config/nvim/setters.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/plugins/telescope.vim


let g:webdevicons_enable_startify = 1
let g:NERDCreateDefaultMappings = 1
" Use <C-l> for trigger snippet expand.
let NERDTreeShowHidden=1


" bar setup
lua require('lualine').setup{options = {theme = 'gruvbox'}}

" lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require('lspconfig').tsserver.setup{on_attatch=require'compe'.on_attatch}
lua require('lspconfig').pyright.setup{on_attatch=require'compe'.on_attatch}
lua require('nvim-treesitter.configs').setup{highlight = {enable = true},indent = {enable = true},}

"######################################################################
" JUPYTEXT 
"######################################################################
let g:jupytext_filetype_map = { 'py': 'python' }
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

"######################################################################
" THEME 
"######################################################################
colorscheme gruvbox
highlight Normal ctermbg=NONE
