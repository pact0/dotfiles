-- let g:auto_session_root_dir = path/to/my/custom/dir
local map = require("utils").map
local leader = "<space>"
local opts = {
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = nil,
    auto_session_suppress_dirs = nil
}
require('auto-session').setup(opts)

vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

map("n", leader .. "ffs",
    "<cmd>lua require('session-lens').search_session({path_display = {'shorten'},theme_conf = {border = true},previewer = true,prompt_title = 'SESSIONS'})<CR>)")


