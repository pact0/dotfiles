local map = require("keymap.bind").map

-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", {noremap = true, silent = true})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

local wk = require("which-key")

-- fugitive additional mappings
vim.cmd(([[
autocmd FileType fugitiveblame nmap <buffer> q gq
autocmd FileType fugitive nmap <buffer> q gq
autocmd FileType fugitive nmap <buffer> <Tab> =
]]))

-- treesitter-unit
vim.api.nvim_set_keymap('v', '<Space>',
                        ':lua require"treesitter-unit".select()<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('o', '<Space>',
                        ':<c-u>lua require"treesitter-unit".select()<CR>',
                        {noremap = true})

local map_normal_leader
local map_normal_g
map_normal_leader = {
    N = {"<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
    f = {
        name = "Telescope",
          f = {"<cmd>Telescope git_files<CR>", "Search project files"},
        w = {"<cmd>Telescope theme=get_dropdown<CR>", "Search word"},
        c = {"<cmd>Telescope git_bcommits<CR>", "Browse blame commits"},
        r = {"<cmd>Telescope  lsp_references<CR>", "Browse LSP references"},
        S = {
            "<cmd>lua require('session-lens').search_session({theme_conf = {border = true},previewer = false,prompt_title = 'SESSIONS'})<CR>)",
            "Browse sessions"
        }
    },
    h = {
        name = "Hunk git",
        s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk"},
        u = {
            '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            "Undo stage hunk"
        },
        r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk"},
        p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk"},
        q = {
            '<cmd>lua do vim.cmd("copen") require"gitsigns".setqflist("all") end <CR>',
            "Add hunks to qf list"
        }
    },
    g = {
        name = "Git",
        b = {'<cmd>lua require"gitsigns".blame_line()<CR>', "Blame link"},
        s = {'<cmd>lua require"gitsigns".stage_buffer()<CR>', "Stage bugger"},
        h = {"<cmd>DiffviewFileHistory<CR>", "File history"},
        d = {
            name = "Diffing",
            c = {"<cmd>DiffviewOpen HEAD~1<CR>", "Last commit"},
            -- d = { "<cmd>Git diff %<CR>", "current file with current branch" },
            x = {"<cmd>DiffviewClose<CR>", "Close diffvire"},
            m = {
                "<cmd>DiffviewOpen origin/main<CR>",
                "Current file with main branch"
            }
        },
        l = {"<cmd>Telescope git_commits<CR>", "Git log"},
        g = {"<cmd>Neogit<CR>", "Git status"},
        z = {
            name = "Stashes",
            l = {"<cmd>Telescope git_stash<CR>", "List stashes"},
            z = {"<cmd>:Git stash<CR>", "run git stash"}
        }
    },
    Z = {M = {"<cmd>ZenMode<CR>", "Toggle ZenMode"}}
}
wk.register(map_normal_leader, {prefix = "<leader>"})

map_normal_g = {
    a = {"<cmd>Telescope lsp_code_actions<CR>", "Code actions"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
    h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Display hover tooltip"},
    i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation "},
    t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition"},
    r = {"<cmd>Telescope lsp_references<CR>", "References"}
}

-- wk.register(map_normal_g, { prefix = "g" })
