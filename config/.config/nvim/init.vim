let mapleader = " "

source $HOME/.config/nvim/setters.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/dashboard.vim

let g:webdevicons_enable_startify = 1
let g:NERDCreateDefaultMappings = 1
" Use <C-l> for trigger snippet expand.
let NERDTreeShowHidden=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" bar setup
lua require('lualine').setup{options = {theme = 'gruvbox'}}

" lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
require('lspconfig').tsserver.setup{on_attatch=require'compe'.on_attatch}
require('lspconfig').pyright.setup{on_attatch=require'compe'.on_attatch}
require('nvim-treesitter.configs').setup{
    highlight = {enable = true, use_languagetree = true},
    indent = {enable = true},
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        },
}

EOF
"######################################################################
" JUPYTEXT 
"######################################################################
let g:jupytext_filetype_map = { 'py': 'python' }


"######################################################################
" THEME 
"######################################################################
colorscheme gruvbox
highlight Normal ctermbg=NONE


