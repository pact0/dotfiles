-- Load Modules:
require("core")
require("overwrite")

-- Configuration
require("Navigator").setup()

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("keymap")
map("n", "<A-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map("n", "<A-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map("n", "<A-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map("n", "<A-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map("n", "<A-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)
