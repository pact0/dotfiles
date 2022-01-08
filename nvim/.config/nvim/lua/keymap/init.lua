local bind = require("keymap.bind")
local map = bind.map
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
local map_key = bind.map_key
local global = require("core.global")
require("keymap.config")

local plug_map = {
  -- os
  ["n|<c-s>"] = map_cu("write"):with_noremap(),
  ["i|<c-s>"] = map_cu('"normal :w"'):with_noremap():with_silent(),
  ["v|<c-s>"] = map_cu('"normal :w"'):with_noremap():with_silent(),
  ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),

  --win
  ["n|<A-[>"] = map_cr("vertical resize -5"):with_silent(),
  ["n|<A-]>"] = map_cr("vertical resize +5"):with_silent(),
  ["n|<C-q>"] = map_cmd(":wq<CR>"),

  -- Insert
  -- ["i|<C-w>"]      = map_cmd('<C-[>diwa'):with_noremap(),
  ["i|<C-h>"] = map_cmd("<BS>"):with_noremap(),
  -- ["i|<C-d>"]      = map_cmd('<Del>'):with_noremap(),  -- I will use <C-d> as <d-> in mac
  ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
  -- command line
  ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
  ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
  ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
  ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
  ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
  ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
  ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
  -- Vim map
  ["n|<C-x>k"] = map_cr("Bdelete"):with_noremap():with_silent(),
  ["n|]w"] = map_cu("WhitespaceNext"):with_noremap(),
  ["n|[w"] = map_cu("WhitespacePrev"):with_noremap(),
  ["i|<TAB>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
  ["i|<S-TAB>"] = map_cmd("v:lua.s_tab_complete()"):with_silent():with_expr(),
  ["s|<TAB>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
  ["s|<S-TAB>"] = map_cmd("v:lua.s_tab_complete()"):with_silent():with_expr(),
  -- person keymap
  -- ["n|mf"]             = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap();
  -- Lsp mapp work when insertenter and lsp start
  ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
  ["n|<leader>ll"] = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
  ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
  -- ["n|gt"]             = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
  -- ["n|<Leader>cw"]     = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
  -- ["n|<Leader>ct"] = map_args("Template"),
  -- ["n|<Leader>tf"] = map_cu('DashboardNewFile'):with_noremap():with_silent(),
  -- Plugin nvim-tree
  -- ["n|<Leader>e"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
  -- ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
  -- Plugin MarkdownPreview
  ["n|<Leader>om"] = map_cu("MarkdownPreview"):with_noremap():with_silent(),
  -- Plugin DadbodUI
  ["n|<Leader>od"] = map_cr("DBUIToggle"):with_noremap():with_silent(),
  -- Plugin Telescope
  ["n|<Leader>bb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
  ["n|<Leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
  ["n|<Leader>fb"] = map_cu("Telescope file_browser"):with_noremap():with_silent(),
  ["n|<Leader>ff"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
  ["i|<C-r>"] = map_cmd("<cmd>Telescope registers<cr>"):with_noremap():with_silent(),
  ["n|<Leader>fr"] = map_cmd("<cmd>Telescope registers<cr>"):with_noremap():with_silent(),
  ["n|<Leader>fj"] = map_cmd('<cmd>lua require"utils.telescope".jump()<CR>'):with_noremap():with_silent(),
  ["n|<M-p>"] = map_cmd(
    '<cmd>lua require("telescope").extensions.frecency.frecency({ sorter = require("telescope").extensions.fzf.native_fzf_sorter() })<CR>'
  ):with_silent(),
  ["n|<Leader>cl"] = map_cr('<cmd>lua require("telescope").extensions.neoclip.default()'):with_silent(),
  ["n|<Leader>fz"] = map_cr('<cmd>lua require("telescope").extensions.zoxide.list()'):with_silent(),
  ["n|<Leader>fp"] = map_cr('<cmd>lua require("telescope").extensions.projects.projects()'):with_silent(),
  ["n|<Leader>fw"] = map_cu("Telescope grep_string"):with_noremap():with_silent(),
  ["n|<Leader>fl"] = map_cu("Telescope loclist"):with_noremap():with_silent(),
  ["n|<Leader>fc"] = map_cu("Telescope git_commits"):with_noremap():with_silent(),
  ["n|<Leader>ft"] = map_cu("Telescope help_tags"):with_noremap():with_silent(),
  -- GUI, kitty

  ["in|<C-p>"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
  -- ["in|<d-T>"] = map_cu("Telescope"):with_noremap():with_silent(),
  -- ["in|<d-f>"] = map_cr("<cmd> lua require'telescope.builtin'.grep_string({defulat_text=vim.fn.expand('cword')})"):with_noremap()
  --     :with_silent(),

  ["in|<C-f>"] = map_cmd([['<cmd>lua require"telescope.builtin".live_grep()<cr>' . expand('<cword>')]])
    :with_expr()
    :with_silent(),
  --     :with_expr(),
  -- ["in|<d-f>"] = map_cmd([[ ':Telescope live_grep<cr>' . expand('<cword>')]]):with_expr():with_silent(),
  --     :with_expr(),

  ["in|<d-F>"] = map_cmd(
    [['
   <cmd> lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>' .  ' --type ' . &ft . ' ' . expand('<cword>')]]
  ):with_expr():with_silent(),
  -- ["in|<d-F>"] = map_cr("<cmd> lua require'telescope.builtin'.live_grep({defulat_text=vim.fn.expand('cword')})"):with_noremap()
  -- :with_silent(),
  -- ["n|<Leader>fd"]     = map_cu('Telescope dotfiles path='..global..'/.dotfiles'):with_noremap():with_silent(),
  -- ["n|<Leader>fs"] = map_cu('Telescope gosource'):with_noremap():with_silent(),
  ["n|w"] = map_cmd('v:lua.word_motion_move("w")'):with_silent():with_expr(),

  -- Plugin QuickRun
  ["n|<Leader>r"] = map_cr("<cmd> lua require'internal.quickrun'.run_command()"):with_noremap():with_silent(),
  -- Plugin Vista
  ["n|<Leader>v"] = map_cu("Vista"):with_noremap():with_silent(),
  ["n|<F8>"] = map_cu("AerialToggle"):with_silent(),
  -- ["x|gcc"] = map_cmd("<ESC><CMD>lua ___comment_gb(vim.fn.visualmode())<CR>"):with_silent(),
  -- ["x|gcc"] = map_cmd("<ESC><CMD>lua ___comment_gc(vim.fn.visualmode())<CR>"):with_silent(),

  ["x|<Leader>c<Space>"] = "gc",
  ["n|<Leader>c<Space>"] = map_cmd("<CMD>lua require'Comment'.toggle()<CR>"):with_silent(),
  ["n|<d-/>"] = map_cmd("<ESC><CMD>lua require'Comment'.toggle()<CR>"):with_silent(),
  ["i|<d-/>"] = map_cmd("<ESC><CMD>lua require'Comment'.toggle()<CR>"):with_silent(),
  ["x|<d-/>"] = map_key("gc"),

  ["n|<m-/>"] = map_cmd("<ESC><CMD>lua require'Comment'.toggle()<CR>"):with_silent(),
  ["i|<m-/>"] = map_cmd("<ESC><CMD>lua require'Comment'.toggle()<CR>"):with_silent(),
  ["x|<m-/>"] = "gc",
  ["n|<C-md>"] = map_cmd("<cmd>lua require('utils.dump_mappings').dump('n'))<CR>"),
  ["n|<A-h>"] = map_cmd("<CMD>lua require('Navigator').left()<CR>"),
  ["n|<A-j>"] = map_cmd("<CMD>lua require('Navigator').down()<CR>"),
  ["n|<A-k>"] = map_cmd("<CMD>lua require('Navigator').up()<CR>"),
  ["n|<A-l>"] = map_cmd("<CMD>lua require('Navigator').right()<CR>"),
}

bind.nvim_load_mapping(plug_map)

-- local wk = require("which-key")
--
-- -- Reselect visual selection after indenting
-- vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
-- vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
--
-- -- When text is wrapped, move by terminal rows, not lines, unless a count is provided
-- vim.cmd([[
-- noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
-- noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
-- ]])
--
-- -- terminal mode bindings
-- wk.register({ ["<C-g>"] = { "<cmd>lua require('FTerm').toggle()<CR>", "Close the terminal" } }, { mode = "t" })
--
-- -- fugitive additional mappings
-- vim.cmd([[
-- autocmd FileType fugitiveblame nmap <buffer> q gq
-- autocmd FileType fugitive nmap <buffer> q gq
-- autocmd FileType fugitive nmap <buffer> <Tab> =
-- ]])
--
-- -- treesitter-unit
-- vim.api.nvim_set_keymap("v", "<Space>", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("o", "<Space>", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
--
-- -- normal mode bindings
-- local map_normal_leader
-- local map_normal_g
-- map_normal_leader = {
--   ["<Enter>"] = {
--     function()
--       require("telescope.builtin").resume()
--     end,
--     "Resume last picker",
--   },
--   w = { "<cmd>:w<CR>", "Save current buffer" },
--   ["<S-w>"] = { "<cmd>:wq<CR>", "Save current buffer and quit" },
--   ["."] = {
--     function()
--       require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
--     end,
--     "open relative",
--   },
--   [":"] = { "<cmd>Telescope command_history<CR>", "Find recent command" },
--   [";"] = { "<cmd>Telescope commands<CR>", "Find command" },
--   b = {
--     name = "Buffers",
--     a = { "<c-^>", "Switch back to previous buffer" },
--     b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
--     d = { "<cmd>:BufDel<CR>", "Delete current buffer" },
--     n = { "<cmd>:bn<CR>", "Next buffer" },
--     p = { "<cmd>:bp<CR>", "Previous buffer" },
--     ["<Tab>"] = { "<c-^>", "Switch back to previous buffer" },
--     w = { "<cmd>:bw<CR>", "close and save current buffer" },
--     x = { require("jh.notes").open_scratch, "Open scratch buffer" },
--   },
--   c = {
--     name = "Code / LSP",
--     [" "] = { "<cmd>Telescope treesitter<CR>", "Treesitter jump" },
--     a = { "<cmd>Telescope lsp_code_actions<CR>", "Code actions" },
--     c = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
--     d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
--     e = {
--       name = "diagnostic",
--       d = { "<cmd>Telescope lsp_document_diagnostics<CR>", "Document diagnostics" },
--       w = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace diagnostics" },
--
--       p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous" },
--       n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next" },
--     },
--     f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "formatting" },
--     h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
--     i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
--     j = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
--     k = {
--       name = "Call tree",
--       o = {
--         function()
--           require("litee.lsp.wrappers").buf_outgoing_calls()
--         end,
--         "Outgoing calls",
--       },
--       i = {
--         function()
--           require("litee.lsp.wrappers").buf_incoming_calls()
--         end,
--         "Incoming calls",
--       },
--       k = {
--         function()
--           require("litee.lsp.wrappers").buf_document_symbol()
--         end,
--         "Symbols outline",
--       },
--     },
--     l = {
--       name = "Code Lens",
--       l = { "<cmd>lua vim.lsp.codelens.refresh()<CR>", "Run" },
--       e = { "<cmd>lua vim.lsp.codelens.refresh()<CR>", "Refresh" },
--     },
--     r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
--     ["R"] = { "<cmd>Telescope lsp_references<CR>", "References" },
--     t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
--     q = {
--       name = "Quickfix",
--       q = { "<cmd>Telescope quickfix<CR>", "Quickfix" },
--       n = { "<cmd>cn<CR>", "Next error" },
--       p = { "<cmd>cp<CR>", "Previous error" },
--     },
--     ["L"] = { "<cmd>Telescope loclist<CR>", "Loclist" },
--     w = { "<cmd>:%s/\\s\\+$//<CR>:let @/=''<CR>``", "Delete trailing whitespaces" },
--   },
--   d = {
--     name = "Debugger",
--     q = { "<cmd>VimspectorReset<CR>", "Quit debugging" },
--     -- e = { "<cmd>VimspectorEval<CR>", "Eval" },
--     c = { "<cmd>call vimspector#Continue()<CR>", "Continue" },
--     r = { "<cmd>call vimspector#Restart()<CR>", "Restart" },
--     s = { "vimspector#Stop()<CR>", "Stop" },
--     p = { "<cmd>call vimspector#Pause()<CR>", "Pause" },
--     t = { "<cmd>call vimspector#ToggleBreakpoint()<CR>", "Toggle Breakpoint" },
--     i = { "<cmd>call vimspector#StepInto()<CR>", "Step into" },
--     n = { "<cmd>call vimspector#StepOver()<CR>", "Step over" },
--     o = { "<cmd>call vimspector#StepOut()<CR>", "Step out" },
--   },
--   e = {
--     name = "Easy movements",
--     [" "] = { "<cmd>HopPattern<CR>", "Jump to pattern" },
--     -- Colemak user here, those are my hjkl keys
--     ["e"] = { "<cmd>HopWord<CR>", "Jump to words" },
--     ["i"] = { "<cmd>HopChar1<CR>", "Jump to characters" },
--     ["l"] = { "<cmd>HopLineStart<CR>", "Jump to lines" },
--   },
--
--   f = { name = "Files", r = { "<cmd>Telescope oldfiles<CR>", "Recent files" } },
--   g = {
--     name = "Git",
--     -- a = { "<cmd>:Gw<CR>", "Git add current buffer" },
--     b = { "<cmd>Telescope git_branches<CR>", "Show branches" },
--     ["B"] = { "<cmd>Telescope git_bcommits<CR>", "Git Blame" },
--     c = { "<cmd>:Git commit<CR>", "Git commit" },
--     ["C"] = {
--       function()
--         local branch = vim.fn.input("Branch name: ", "")
--         vim.cmd(":silent Git cob " .. branch)
--       end,
--       "Git checkout -b",
--     },
--     d = {
--       name = "Diffing",
--       c = { "<cmd>Git diff HEAD~1<CR>", "last commit" },
--       d = { "<cmd>Git diff %<CR>", "current file with current branch" },
--       m = { "<cmd>Git diff main %<CR>", "current file with main branch" },
--     },
--     l = { "<cmd>Telescope git_commits<CR>", "Git log" },
--     g = { "<cmd>:Git<CR>", "Git status" },
--     f = { "<cmd>:Git fetch<CR>", "Git fetch" },
--     G = { "<cmd>Telescope git_status<CR>", "Current changes" },
--     -- ['M'] = TODO diff between this branch and main, with the above ui
--     ["P"] = { "<cmd>:Git push<CR>", "Git push" },
--     p = { "<cmd>:Git pull<CR>", "Git pull" },
--     w = { "<cmd>:Gw<CR>", "Git add %" },
--     z = {
--       name = "Stashes",
--       l = { "<cmd>Telescope git_stash<CR>", "List stashes" },
--       z = { "<cmd>:Git stash<CR>", "run git stash" },
--     },
--   },
--   ["G"] = {
--     name = "GitHub",
--     i = {
--       function()
--         require("telescope").extensions.gh.issues()
--       end,
--       "List issues",
--     },
--     p = {
--       function()
--         require("telescope").extensions.gh.pull_requests()
--       end,
--       "List PRs",
--     },
--     c = { "<cmd>!gh pr create -w<CR>", "Create a PR and open it in a browser" },
--     o = { "<cmd>!gh pr view -w<CR>", "Open the PR in a browser" },
--     b = { "<cmd>!gh browse<CR>", "Open the current repo in a browser" },
--   },
--   h = {
--     name = "Help and misc helpers",
--     p = {
--       name = "Packages",
--       c = { "<cmd>PackerClean<CR>", "Clean packages" },
--       s = { "<cmd>PackerSync<CR>", "Install packages" },
--       u = { "<cmd>PackerUpdate<CR>", "Update packages" },
--       ["S"] = { "<cmd>PackerStatus<CR>", "List packages" },
--     },
--     ["_"] = {
--       function()
--         _G.dump(require("jh.utils").dump_which_key_markdown(map_normal_leader))
--       end,
--       "Copy in the OS clipboard a markdown dump of all leader mappings",
--     },
--     h = { "<cmd>Telescope help_tags<CR>", "Inline help" },
--     m = { "<cmd>Telescope man_pages<CR>", "Man pages" },
--     t = { "<cmd>Telescope colorscheme<CR>", "Color schemes" },
--     ["T"] = { "<cmd>Telescope monarized<CR>", "Monarized styles" },
--     r = {
--       function()
--         require("jh.utils").reload_my_code()
--       end,
--       "Reload 'jh.*' lua modules",
--     },
--     ["R"] = { "<cmd>Telescope reloader<CR>", "Reload a module" },
--   },
--   n = { name = "Notes", f = { require("jh.notes").find_notes, "Find notes" } },
--   o = {
--     name = "Others",
--     t = { "<cmd>lua require('FTerm').toggle()<CR>", "Toggle terminal" },
--     q = { "<Plug>(qf_qf_toggle)<CR>", "Toggle Quickfix" },
--     l = { "<Plug>(qf_loc_toggle)<CR>", "Toggle Loclist" },
--     p = { "<cmd>NvimTreeToggle<CR>", "Open project drawer" },
--   },
--   p = {
--     name = "Project", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" },
--     -- p = { "<cmd>Telescope session-lens search_session<cr>", "Find File" },
--     t = { "<cmd>TodoTelescope<CR>", "List project TODOs" },
--     x = { require("jh.notes").open_current_project_notes, "Open project notes" },
--   },
--   s = {
--     name = "Search",
--     b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Fuzzy search in current buffer" },
--     p = { "<cmd>Telescope live_grep<CR>", "Find in project" },
--     s = { "<cmd>Telescope live_grep search_dirs=%:p:h<CR>", "Find in project" },
--     c = { "<cmd>let @/ = \"\"<CR>:echo 'Search highlight cleared'<CR>", "Clear search" },
--     R = {
--       function()
--         require("spectre").open()
--       end,
--       "Search and replace in current project",
--     },
--   },
--   t = {
--     name = "Tabs",
--     c = { "<cmd>:tabnew<CR>", "Create tab" },
--     n = { "<cmd>:tabn<CR>", "Next tab" },
--     N = { "<cmd>:tabp<CR>", "Prev tab" },
--     q = { "<cmd>:tabclose<CR>", "Close tab" },
--   },
--   z = {
--     name = "Settings Toggles",
--     b = {
--       function()
--         require("nvim-biscuits").toggle_biscuits()
--       end,
--       "Closing brackets annotations",
--     },
--     c = { "<cmd>ColorToggle<CR>", "Hex colors highlighting" },
--     i = { "<cmd>IndentBlanklineToggle!<CR>", "Indent Guide" },
--     l = { "<cmd>set invnumber<CR>", "Line numbers visibility" },
--     z = { "<cmd>ZenMode<CR>", "Zen Mode" },
--     ["Z"] = { "<cmd>Twilight<CR>", "Dim unfocused code" },
--   },
-- }
-- wk.register(map_normal_leader, { prefix = "<leader>" })
--
-- map_normal_g = {
--   a = { "<cmd>Telescope lsp_code_actions<CR>", "Code actions" },
--   d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
--   h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Display hover tooltip" },
--   i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation " },
--   t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
--   r = { "<cmd>Telescope lsp_references<CR>", "References" },
-- }
--
-- wk.register(map_normal_g, { prefix = "g" })
