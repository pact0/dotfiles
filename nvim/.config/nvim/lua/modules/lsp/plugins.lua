local lsp = {}
local conf = require("modules.lsp.config")

lsp["williamboman/nvim-lsp-installer"] = {config = conf.lsp, opt = true}

lsp["ray-x/lsp_signature.nvim"] = {opt = true}

lsp["neovim/nvim-lspconfig"] = {opt = true}

lsp["onsails/lspkind-nvim"] = {opt = true}

lsp["RishabhRD/nvim-lsputils"] = {opt = true}

return lsp
