let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/setters.vim
"lua require('pack')
" needs to be first before plugins init

lua require('impatient')

lua require('plugins')



let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh', "CMakeLists.txt"]


let g:suda_smart_edit = 1
let g:Hexokinase_highlighters = ['foregroundfull']
let g:Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>b :ls<cr>:b<space>
let g:mundo_width = 60
let g:mundo_preview_height = 20
let g:mundo_right = 1

let g:webdevicons_enable_startify = 1

colorscheme gruvbox

