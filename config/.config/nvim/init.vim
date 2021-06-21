source $HOME/.config/nvim/setters.vim

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set rtp +=~/.config/nvim

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
" debugging leader p 

Plug 'meain/vim-printer'
" autocomplete and snippets
Plug 'neoclide/coc-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'adelarsq/vim-matchit'

" bar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" scientific notation 
Plug 'jbyuki/nabla.nvim'
call plug#end()

nnoremap <F5> :lua require("nabla").place_inline()<CR>
colorscheme gruvbox
highlight Normal ctermbg=NONE

let mapleader = " "

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

set mouse=a
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-reference)
" nnoremap<C-p> :GFiles<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
let NERDTreeShowHidden=1
" For global replace
" Function to rename the variable under the cursor
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>r :call Rnvar()<CR>
" quit if nerdtree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" run pretty on save

" bar setup
lua require('lualine').setup{options = {theme = 'gruvbox'}}

" lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require('lspconfig').tsserver.setup{on_attatch=require'compe'.on_attatch}
lua require('lspconfig').pyright.setup{on_attatch=require'compe'.on_attatch}

" treesitter
lua << EOF
require('nvim-treesitter.configs').setup{highlight = {enable = true},
indent = {enable = true},

}
EOF


" Telescope setup
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>ps :lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require("telescope.builtin").find_files({prompt_title = "< VimRC >",cwd = "~/.config/" })<CR>
nnoremap <leader>gc :lua require('telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

" map tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

