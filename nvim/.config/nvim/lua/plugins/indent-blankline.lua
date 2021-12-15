local utils = require 'utils'
require("indent_blankline").setup {
    filetype_exclude = {
        "vimwiki", "man", "gitmessengerpopup", "diagnosticpopup", "lspinfo",
        "packer", "TelescopePrompt", "TelescopeResults", ""

    },
    buftype_exclude = {"terminal", "nofile"},
    space_char_blankline = " ",
    use_treesitter = true,
    show_foldtext = true,
    strict_tabs = true,
    debug = true,
    disable_with_nolist = true,
    max_indent_increase = 1,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blank_indent = false,
    context_patterns = {
        "class", "function", "func_literal", "method", "^if", "while", "for",
        "with", "try", "except", "argument_list", "object", "dictionary",
        "element"
    }

}

utils.map('n', ',ti', '<Cmd>IndentBlanklineToggle<CR>',
          {noremap = true, silent = true})

-- vim.g.indent_blankline_enabled = false
-- -- vim.g.indent_blankline_char = "┊"
-- vim.g.indent_blankline_char = "│"
-- vim.g.indent_blankline_space_char = ' '
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
-- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
-- vim.g.indent_blankline_char_highlight = 'LineNr'
-- vim.g.indent_blankline_strict_tabs = true
-- vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_context_patterns = {
--     "class",
--     "function",
--     "method",
--     "^if",
--     "while",
--     "for",
--     "with",
--     "func_literal",
--     "block",
--     "try",
--     "except",
--     "argument_list",
--     "object",
--     "dictionary"
-- }
--
-- -- vim.api.nvim_set_keymap('', '<leader>"', '<Esc>:IndentBlanklineToggle<CR>',
-- vim.api.nvim_set_keymap('', '<leader>"',
--   '<cmd>lua require("indent_blankline.commands").toggle("<bang>" == "!")<CR>',
--   { noremap = true, silent = true })
