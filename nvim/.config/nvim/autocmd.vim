"######################################################################
" AUTOCMD
"######################################################################

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" run pretty on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" quit if nerdtree is the last open window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
"
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

autocmd ColorScheme * hi! Normal ctermbg=NONE guibg=NONE

" quickscope 
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#af3a03' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#076678' gui=underline ctermfg=81 cterm=underline
augroup END

highlight QuickScopePrimary guifg='#af3a03' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#076678' gui=underline ctermfg=81 cterm=underline


au FileType rst let b:presenting_slide_separator = '\v(^|\n)\~{4,}'
