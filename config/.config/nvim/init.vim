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

let g:webdevicons_enable_startify = 1
let g:NERDCreateDefaultMappings = 1
" Use <C-l> for trigger snippet expand.
let NERDTreeShowHidden=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

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


"######################################################################
" THEME 
"######################################################################
colorscheme gruvbox
highlight Normal ctermbg=NONE

packadd! vimspector

" Vimspector
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
