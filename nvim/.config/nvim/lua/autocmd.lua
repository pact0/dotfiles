vim.cmd [[augroup Autogroup]]

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="HighlightedyankRegion", timeout=150}]]
vim.cmd [[autocmd CursorMoved * lua require('fold').close_all()]]
vim.cmd [[autocmd User FugitiveBlob nnoremap <buffer> <space>gd :Gvdiff !~1<CR>]]
vim.cmd [[autocmd User FugitiveBlob set winhighlight+=,DiffAdd:DiffDeleteOld]]
vim.cmd [[autocmd User BQFPreview setlocal list | lua require("indent_blankline.commands").refresh(false)]]

vim.cmd [[augroup END]]

