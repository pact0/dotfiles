local lsp = {}

-- lsp["neovim/nvim-lspconfig"] = {
--   -- event = 'BufRead',
--   -- ft = {'html','css', 'javascript', 'java', 'javascriptreact', 'vue','typescript', 'typescriptreact', 'go', 'lua', 'cpp', 'c',
--   -- 'markdown', 'makefile','python','bash', 'sh', 'php', 'yaml', 'json', 'sql', 'vim', 'sh'},
--   config = conf.nvim_lsp,
--   -- event = 'CursorHold',
--   opt = true,
-- }
--
-- -- note: part of the code is used in navigator
-- lsp["ray-x/lsp_signature.nvim"] = {
--   opt = true,
--   config = function()
--     require("lsp_signature").setup({
--       bind = true,
--       -- doc_lines = 4,
--       toggle_key = "<C-x>",
--       floating_window = true,
--       floating_window_above_cur_line = true,
--       hint_enable = true,
--       fix_pos = false,
--       -- floating_window_above_first = true,
--       log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
--       debug = plugin_debug(),
--       verbose = plugin_debug(),
--       -- hi_parameter = "Search",
--       zindex = 1002,
--       timer_interval = 100,
--       extra_trigger_chars = {},
--       handler_opts = {
--         border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
--       },
--       max_height = 4,
--     })
--   end,
-- }


return {}
