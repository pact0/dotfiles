local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = {"src/parser.c", "src/scanner.cc"},
        branch = "main"
    }
}

parser_configs.http = {
    install_info = {
        url = "https://github.com/NTBBloodbath/tree-sitter-http",
        files = {"src/parser.c"},
        branch = "main"
    }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    autopairs = {enable = true},
    rainbow = {enable = true},
    highlight = {
        enable = true,
        language_tree = true,
        additional_vim_regex_highlighting = {"org"}
    },
    indent = {enable = true},
    refactor = {highlight_definitions = {enable = true}},
    autotag = {enable = true},
    context_commentstring = {enable = true},
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        }
    }
}

