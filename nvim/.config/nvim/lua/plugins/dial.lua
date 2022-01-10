local dial = require("dial")
local map = require'utils'.map

dial.config.searchlist.normal = {
    "number#decimal", "number#hex", "number#binary", "date#[%Y/%m/%d]",
    "markup#markdown#header", 'date#[%Y-%m-%d]', 'date#[%H:%M:%S]', 'date#[%H:%M]'
}

-- vmap g<C-a> <Plug>(dial-increment-additional)
-- vmap g<C-x> <Plug>(dial-decrement-additional)
map('n', "<C-a>", "<Plug>(dial-increment)", {noremap = false})
map('v', "<C-a>", "<Plug>(dial-increment)", {noremap = false})

map('n', "<C-x>", "<Plug>(dial-decrement)", {noremap = false})
map('v', "<C-x>", "<Plug>(dial-decrement)", {noremap = false})

-- toggle ture/false
dial.augends["custom#boolean"] = dial.common.enum_cyclic {
    name = "boolean",
    strlist = {"true", "false"}
}
table.insert(dial.config.searchlist.normal, "custom#boolean")

-- 80
-- 2025/01/10
-- 2027-04-12
-- 14:97
-- 0b11011000
