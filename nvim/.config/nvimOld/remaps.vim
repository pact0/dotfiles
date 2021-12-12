"######################################################################
" REMAPS
"######################################################################

let g:qff_l = 0
let g:qfl_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:qfl_g == 1
            let g:qfl_g = 0
            cclose
        else
            let g:qfl_g = 1
            copen
        end
    else
        if g:qff_l == 1
            let g:qff_l = 0
            lclose
        else
            let g:qff_l = 1
            lopen
        end
    endif
endfun

nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

" Function to rename the variable under the cursor
"nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" call replace all
nnoremap <leader>rr :call Rnvar()<CR>

" scinetific notation Latex
nnoremap <F5> :lua require("nabla").place_inline()<CR>

" nnoremap<C-p> :GFiles<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" jump to definition and to reference 
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-reference)

" toggle markdown preview
nmap <leader>mp <Plug>MarkdownPreviewToggle
" map tab to trigger completion
"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()




lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder

EOF

"_G.tab_complete = function()
  "if vim.fn.pumvisible() == 1 then
    "return t "<C-n>"
  "elseif vim.fn.call("vsnip#available", {1}) == 1 then
    "return t "<Plug>(vsnip-expand-or-jump)"
  "elseif check_back_space() then
    "return t "<Tab>"
  "else
    "return vim.fn['compe#complete']()
  "end
"end
"_G.s_tab_complete = function()
  "if vim.fn.pumvisible() == 1 then
    "return t "<C-p>"
  "elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    "return t "<Plug>(vsnip-jump-prev)"
  "else
    "-- If <S-Tab> is not working in your terminal, change it to <C-h>
    "return t "<S-Tab>"
  "end
"end

"vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
"vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
"vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
"vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

nnoremap <silent> <S-Up>    :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<CR>``
nnoremap <silent> <S-Down>  :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<CR>``

inoremap <silent> <S-Up>    <C-O>m`<C-O>:move -2<CR><C-O>``
inoremap <silent> <S-Down>  <C-O>m`<C-O>:move +1<CR><C-O>``

vnoremap <silent> <S-Down>  :<C-U>exec "'<,'>move '>+" . (0+v:count1)<CR>gv
vnoremap <silent> <S-Up>    :<C-U>exec "'<,'>move '<-" . (1+v:count1)<CR>gv

" open header/source file
nnoremap <silent> <A-o> :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <leader>oh :FSSplitLeft<cr>
nnoremap <silent> <leader>oj :FSSplitBelow<cr>
nnoremap <silent> <leader>ok :FSSplitAbove<cr>
nnoremap <silent> <leader>ol :FSSplitRight<cr>


" vv selects till end of line not including new line
vnoremap v $h
"Y in v mode copiers to selection
vnoremap Y "*y

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>



nnoremap <F5> :wa <bar> :set makeprg=cd\ build\ &&\ cmake\ -DCMAKE_BUILD_TYPE=debug\ -DCMAKE_EXPORT_COMPILE_COMMANDS=1\ ../view\ &&\ cmake\ --build\ . <bar> :compiler gcc <bar> :make <CR>
