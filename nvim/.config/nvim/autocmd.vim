"######################################################################
" AUTOCMD
"######################################################################

autocmd ColorScheme * hi! Normal ctermbg=NONE guibg=NONE

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
