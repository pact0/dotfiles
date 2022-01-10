local ui = {}
local conf = require("modules.ui.config")

ui["kyazdani42/nvim-web-devicons"] = {}

ui["dstein64/nvim-scrollview"] = { event = { "CursorMoved", "CursorMovedI" }, config = conf.scrollview }

ui["lukas-reineke/indent-blankline.nvim"] = { opt = true, config = conf.blankline }

ui["kyazdani42/nvim-tree.lua"] = {
  cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  -- requires = {'kyazdani42/nvim-web-devicons'},
  setup = conf.nvim_tree_setup,
  config = conf.nvim_tree,
}

ui["nvim-lua/plenary.nvim"] = { config = function ()
end }


return ui
