local function buf_set_keymap(...)
vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local opts = {noremap = true, silent = true}

require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        excluded_filetypes = { "harpoon" }
    },
})


buf_set_keymap('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
buf_set_keymap('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
buf_set_keymap('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
buf_set_keymap('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
buf_set_keymap('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>', opts)

buf_set_keymap('n', '<leader>a', ':lua require("harpoon.ui").add_file()<CR>', opts)
buf_set_keymap('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

-- nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
-- nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
-- nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
-- 
-- nnoremap <silent> <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
-- nnoremap <silent> <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
-- nnoremap <silent> <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
-- nnoremap <silent> <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
