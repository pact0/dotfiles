local map = require("keymap.bind").map

-- avoid clashing with leader as space
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })


local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

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
vim.api.nvim_set_keymap('v', '<Space>', ':lua require"treesitter-unit".select()<CR>', {noremap=true})
vim.api.nvim_set_keymap('o', '<Space>', ':<c-u>lua require"treesitter-unit".select()<CR>', {noremap=true})

local map_normal_leader
local map_normal_g
map_normal_leader = {
  f = {
    name = "Telescope",
    f = {"<cmd>Telescope git_files<CR>", "Search project files"},
    w = {"<cmd>Telescope theme=get_dropdown<CR>", "Search word"},
    c = {"<cmd>Telescope git_bcommits<CR>", "Browse blame commits"},
    r = {"<cmd>Telescope  lsp_references<CR>", "Browse LSP references"},
    S = {"<cmd>lua require('session-lens').search_session({theme_conf = {border = true},previewer = false,prompt_title = 'SESSIONS'})<CR>)","Browse sessions"}
    },
  g = {
    name = "Git",
    -- a = { "<cmd>:Gw<CR>", "Git add current buffer" },
    b = { "<cmd>Telescope git_branches<CR>", "Show branches" },
    ["B"] = { "<cmd>Telescope git_bcommits<CR>", "Git Blame" },
    c = { "<cmd>:Git commit<CR>", "Git commit" },
    ['C'] = { function()
      local branch = vim.fn.input("Branch name: ", "")
      vim.cmd(":silent Git cob " .. branch)
    end ,  "Git checkout -b" },
    d = {
      name = "Diffing",
      c = { "<cmd>Git diff HEAD~1<CR>", "last commit" },
      d = { "<cmd>Git diff %<CR>", "current file with current branch" },
      m = { "<cmd>Git diff main %<CR>", "current file with main branch" },
    },
    l = { "<cmd>Telescope git_commits<CR>", "Git log" },
    g = { "<cmd>:Git<CR>", "Git status" },
    f = { "<cmd>:Git fetch<CR>", "Git fetch" },
    G = { "<cmd>Telescope git_status<CR>", "Current changes" },
    -- ['M'] = TODO diff between this branch and main, with the above ui
    ['P'] = { "<cmd>:Git push<CR>", "Git push" },
    p = { "<cmd>:Git pull<CR>", "Git pull" },
    w = { "<cmd>:Gw<CR>", "Git add %" },
    z = {
      name = "Stashes",
      l = { "<cmd>Telescope git_stash<CR>", "List stashes" },
      z = { "<cmd>:Git stash<CR>", "run git stash" },
    },
  },
  Z = {
    M = "<cmd>ZenMode<CR>", "Toggle ZenMode"
  }
}
wk.register(map_normal_leader, { prefix = "<leader>" })

map_normal_g = {
  a = { "<cmd>Telescope lsp_code_actions<CR>", "Code actions" },
  d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
  h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Display hover tooltip" },
  i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation " },
  t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
  r = { "<cmd>Telescope lsp_references<CR>", "References" },
}


wk.register(map_normal_g, { prefix = "g" })
