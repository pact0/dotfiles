require("pqf").setup {

    signs = {error = "", warning = "", info = "", hint = ""}
}

require('bqf').setup({
auto_enable = true
})

vim.g["incsearch#auto_nohlsearch"] = true
vim.g["incsearch#magic"] = "\\v"
vim.g["incsearch#consistent_n_direction"] = true
vim.g["incsearch#do_not_save_error_message_history"] = true
