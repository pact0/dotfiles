"######################################################################
" REMAPS
"######################################################################

" Function to rename the variable under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" call replace all
nnoremap <leader>r :call Rnvar()<CR>

" scinetific notation Latex
nnoremap <F5> :lua require("nabla").place_inline()<CR>

" nnoremap<C-p> :GFiles<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" jump to definition and to reference 
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-reference)
" map tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()



let g:coc_snippet_next = '<tab>'
imap <C-l> <Plug>(coc-snippets-expand)
