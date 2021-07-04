let mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.config/nvim/setters.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/autocmd.vim
source $HOME/.config/nvim/remaps.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/dashboard.vim
source $HOME/.config/nvim/plugins/lsp.vim
source $HOME/.config/nvim/plugins/vimspector.vim

let g:webdevicons_enable_startify = 1
let g:NERDCreateDefaultMappings = 1
let NERDTreeShowHidden=1

" bar setup
lua require('lualine').setup{options = {theme = 'gruvbox'}}

" treesitter
lua << EOF
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
        "cpp"
        },
}
EOF
"######################################################################
" JUPYTEXT
"######################################################################
let g:jupytext_filetype_map = { 'py': 'python' }

set clipboard=unnamedplus
"######################################################################
" THEME
"######################################################################
colorscheme gruvbox
highlight Normal ctermbg=NONE




"let g:neoformat_enabled_cpp = ['clang-format']
"######################################################################
" CPP
"######################################################################
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" access QT and cppreference via vim
let g:openbrowser_search_engines = extend(
\ get(g:, 'openbrowser_search_engines', {}),
\ {
\   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
\   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
\ },
\ 'keep'
\)
nnoremap <silent> <leader>osx :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
nnoremap <silent> <leader>osq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>

