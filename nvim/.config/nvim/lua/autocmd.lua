vim.cmd [[augroup Autogroup]]

vim.cmd [[autocmd BufWritePre * lua require('buffers').write_pre()]]

vim.cmd [[autocmd CursorMoved * lua require('fold').close_all()]]
vim.cmd [[autocmd User FugitiveBlob nnoremap <buffer> <space>gd :Gvdiff !~1<CR>]]
-- vim.cmd [[autocmd User FugitiveBlob set winhighlight+=,DiffAdd:DiffDeleteOld]]
vim.cmd [[autocmd User BQFPreview setlocal list | lua require("indent_blankline.commands").refresh(false)]]

-- " Some buffers can be closed with 'q'
vim.cmd [[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]]
vim.cmd [[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]]

-- " Disable folding in previews
vim.cmd [[ autocmd BufWinEnter * if &previewwindow | setlocal nofoldenable | endif]]
-- " Remember last cursor position
vim.cmd [[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"" | endif]]
-- " Enable yank highlighting
vim.cmd [[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='WildMenu', timeout=4444}]]

vim.cmd [[augroup END]]

