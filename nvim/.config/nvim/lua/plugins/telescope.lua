-- fixes folds when opening file with felescope
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
    hidden = true,
    attach_mappings = function(_)
        telescope_actions.select:enhance({
            post = function()
                vim.cmd(":normal! zx")
            end,
        })
        return true
    end,
}

local actions = require('telescope.actions')

require('telescope').setup {
    pickers = {
        buffers = fixfolds,
        file_browser = fixfolds,
        find_files = fixfolds,
        git_files = fixfolds,
        grep_string = fixfolds,
        live_grep = fixfolds,
        oldfiles = fixfolds,
        -- I probably missed some
    },
    defaults = {
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        file_ignore_patterns = { 'node_modules/.*', '%.env' },
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {mirror = false},
            vertical = {mirror = false},
            prompt_position = "bottom"
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    },
    media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
    }
}

require("telescope").load_extension("media_files")
require("telescope").load_extension("git_worktree")
require('telescope').load_extension('dap')
require('telescope').load_extension('project')
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap("n", "<Leader>f", "[tele]", {})

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope git_files<CR>", {})

vim.api.nvim_set_keymap("n", "[tele]f",
    "<cmd>Telescope find_files <CR>", {})
vim.api.nvim_set_keymap("n", "[tele]g",
    "<cmd>Telescope live_grep theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]G",
    "<cmd>Telescope live_grep theme=get_dropdown vimgrep_arguments=rg,--no-heading,--with-filename,--line-number,--column<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]b",
    "<cmd>Telescope buffers theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]r",
    "<cmd>Telescope lsp_references theme=get_dropdown<CR>",
    {})
vim.api.nvim_set_keymap("n", "[tele]q",
    "<cmd>Telescope quickfix theme=get_dropdown<CR>", {})
vim.api.nvim_set_keymap("n", "[tele]d",
    "<cmd>Telescope lsp_definitions theme=get_dropdown<CR>",
    {})
vim.api.nvim_set_keymap("n", "[tele]D",
    "<cmd>Telescope file_browser theme=get_dropdown cwd=~/Documents<CR>",
    {})
vim.api.nvim_set_keymap("n", "[tele]b",
    "<cmd>Telescope file_browser theme=get_dropdown",
    {})
