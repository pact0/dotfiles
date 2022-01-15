local ui = {}
local conf = require("modules.ui.config")

ui["kyazdani42/nvim-web-devicons"] = {}

ui["dstein64/nvim-scrollview"] = {
    event = {"CursorMoved", "CursorMovedI"},
    config = conf.scrollview
}

ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    config = conf.blankline
}

ui["kyazdani42/nvim-tree.lua"] = {
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    -- requires = {'kyazdani42/nvim-web-devicons'},
    setup = conf.nvim_tree_setup,
    config = conf.nvim_tree
}

-- ui["gelguy/wilder.nvim"] = {
--     requires = {
--         {"romgrk/fzy-lua-native"},
--         {'nixprime/cpsm', run = 'UpdateRemotePlugins'}
--     },
--     opt = true,
--     run = "UpdateRemotePlugins",
--     event = {"CmdwinEnter"},
--     config = conf.wilder
-- }

ui["nanozuki/tabby.nvim"] = {opt = true, config = conf.tabby}

return ui
