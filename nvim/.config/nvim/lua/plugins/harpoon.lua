local map = require'utils'.map
local leader = "<space>"

local opts = {noremap = true, silent = true}

require("harpoon").setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        excluded_filetypes = {"harpoon"}
    }
})

map('n', leader .. '1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', leader .. '2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', leader .. '3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', leader .. '4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
map('n', leader .. '5', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

map('n', leader .. 'a', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

