local lsp = {}
local conf = require("modules.lsp.config")

lsp["williamboman/nvim-lsp-installer"] = {config = conf.lsp, opt = true }

lsp["ray-x/lsp_signature.nvim"] = {
  opt = true,
  config = function()
    require("lsp_signature").setup({
      bind = true,
      -- doc_lines = 4,
      toggle_key = "<C-k>",
      floating_window = true,
      floating_window_above_cur_line = true,
      hint_enable = true,
      fix_pos = false,
      -- floating_window_above_first = true,
      log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
      debug = plugin_debug(),
      verbose = plugin_debug(),
      -- hi_parameter = "Search",
      zindex = 1002,
      timer_interval = 100,
      extra_trigger_chars = {},
      handler_opts = {
        border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
      },
      max_height = 4,
    })
  end,
}

lsp["neovim/nvim-lspconfig"] = { opt = true }

lsp["onsails/lspkind-nvim"] = {}

lsp["RishabhRD/nvim-lsputils"] = {}

return lsp
