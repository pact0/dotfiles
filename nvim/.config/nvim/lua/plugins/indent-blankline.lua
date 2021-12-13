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
