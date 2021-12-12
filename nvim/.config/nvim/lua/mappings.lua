local map = require("utils").map
local leader = "<space>"

map("n", "/", "<Plug>(incsearch-forward)", {noremap = false})
map("n", "?", "<Plug>(incsearch-backward)", {noremap = false})
map("n", "n", "<Plug>(incsearch-nohl-n)", {noremap = false})
map("n", "N", "<Plug>(incsearch-nohl-N)", {noremap = false})
map("n", "*", "<Plug>(incsearch-nohl-*)", {noremap = false})
map("n", "#", "<Plug>(incsearch-nohl-#)", {noremap = false})
map("n", "g*", "<Plug>(incsearch-nohl-g*)", {noremap = false})
map("n", "g#", "<Plug>(incsearch-nohl-g#)", {noremap = false})

map("n", "x", '"_x')

-- #region Navigator
map("n", "<A-h>", "<CMD>lua require('Navigator').left()<CR>")
map("n", "<A-j>", "<CMD>lua require('Navigator').down()<CR>")
map("n", "<A-k>", "<CMD>lua require('Navigator').up()<CR>")
map("n", "<A-l>", "<CMD>lua require('Navigator').right()<CR>")
-- ###

map({"n", "o", "v"}, "H", "^")
map({"n", "o", "v"}, "L", "$")

map("n", leader .. "gd",
    ":set nosplitright<CR>:execute 'Gvdiffsplit ' .. g:git_base<CR>:set splitright<CR>")
map("n", leader .. "gr", ":Gread<CR>")
map("n", leader .. "gb", ":Git blame<CR>")
map("n", leader .. "gs", ":Git<CR>")
map("n", leader .. "gm", "<Plug>(git-messenger)", {noremap = false})
map("n", leader .. "gc", ":0Gclog<CR>", {noremap = false})
map("n", leader .. "gn",
    ":lua require('lists').change_active('Quickfix')<CR>:Git mergetool<CR>")
map("n", leader .. "gh", ":diffget //2<CR> :diffupdate<CR>")
map("n", leader .. "gl", ":diffget //3<CR> :diffupdate<CR>")


-- #visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "*", '"vygv:<C-U>/\\<<C-R>v\\><CR>')
map("v", "#", '"vygv:<C-U>?\\<<C-R>v\\><CR>')
-- #end visual mode

-- # quickfix
map("n", "<UP>", ":lua require('lists').move('up')<CR>", {silent = true})
map("n", "<DOWN>", ":lua require('lists').move('down')<CR>", {silent = true})
map("n", "<LEFT>", ":lua require('lists').move('left')<CR>", {silent = true})
map("n", "<RIGHT>", ":lua require('lists').move('right')<CR>", {silent = true})
map("n", leader .. "c",
    "<Plug>(qf_qf_toggle_stay):lua require('lists').change_active('Quickfix')<CR>",
    {noremap = false, silent = true})
map("n", leader .. "v",
    "<Plug>(qf_loc_toggle_stay):lua require('lists').change_active('Location')<CR>",
    {noremap = false, silent = true})
map("n", leader .. "b", ":lua require('lists').toggle_active()<CR>")

map("n", leader .. "a",

    ":lua require('lists').change_active('Quickfix')<CR>:Ack<space>")
-- # end quickfix

map("x", "iu", ':lua require"treesitter-unit".select()<CR>', {noremap = true})
map("x", "au", ':lua require"treesitter-unit".select(true)<CR>',
    {noremap = true})
map("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>',
    {noremap = true})
map("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>',
    {noremap = true})

map("", "w", "<Plug>CamelCaseMotion_w", {noremap = false})
map("", "b", "<Plug>CamelCaseMotion_b", {noremap = false})
map("", "e", "<Plug>CamelCaseMotion_e", {noremap = false})
map("", "ge", "<Plug>CamelCaseMotion_ge", {noremap = false})

map("n", "<CLEAR-1>", "<Plug>UnconditionalPasteLineAfter", {noremap = false})
map("n", "<CLEAR-2>", "<Plug>UnconditionalPasteLineBefore", {noremap = false})
map("n", "<CLEAR-3>", "<Plug>UnconditionalPasteCommaAfter", {noremap = false})
map("n", "<CLEAR-4>", "<Plug>UnconditionalPasteCommaBefore", {noremap = false})
map("n", "<CLEAR-5>", "<Plug>UnconditionalPasteCommaSingleQuoteAfter",
    {noremap = false})
map("n", "<CLEAR-6>", "<Plug>UnconditionalPasteCommaSingleQuoteBefore",
    {noremap = false})
map("n", "<CLEAR-7>", "<Plug>VimwikiIncrementListItem", {noremap = false})
map("n", "<CLEAR-8>", "<Plug>VimwikiDecrementListItem", {noremap = false})
map("n", "glp", "<Plug>UnconditionalPasteIndentedAfter", {noremap = false})
map("n", "glP", "<Plug>UnconditionalPasteIndentedBefore", {noremap = false})
