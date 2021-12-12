let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/plugins/dashboard.vim
source $HOME/.config/nvim/setters.vim

lua require'setters'
lua require'autocmd'
lua require'mappings'
lua require("lists").setup()
lua require("git").setup()
let g:Hexokinase_highlighters = ['foregroundfull']
let g:Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"

let mapleader = " "
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'plugins.cmp'
lua require'plugins.gitsigns'
lua require'plugins.lspconfig'
lua require'plugins.lspkind'
lua require'plugins.lualine'
lua require'plugins.bqf'
lua require'plugins.treesitter'
lua require'plugins.telescope'
lua require'plugins.dap'
lua require'plugins.navigator'
lua require'plugins.comment'
lua require'plugins.lightspeed'
lua require'plugins.luasnip'
lua require'plugins.indent-blankline'
lua require'plugins.defx'

nnoremap <leader>u :MundoToggle<CR>
nnoremap <silent><leader>m :MaximizerToggle<CR>
let g:mundo_width = 60
let g:mundo_preview_height = 20
let g:mundo_right = 1

let g:webdevicons_enable_startify = 1

colorscheme gruvbox
