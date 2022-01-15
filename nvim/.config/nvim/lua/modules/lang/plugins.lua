local lang = {}
local conf = require("modules.lang.config")

lang["nathom/filetype.nvim"] = {
    -- event = {'BufEnter'},
    setup = function() vim.g.did_load_filetypes = 1 end
}

lang["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    config = conf.nvim_treesitter,
    require = {
        'tree-sitter/tree-sitter-cpp',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-neorg/tree-sitter-norg', 'David-Kunz/treesitter-unit',
        'windwp/nvim-ts-autotag', 'p00f/nvim-ts-rainbow',
        'MDeiml/tree-sitter-markdown',

        -- 'nvim-treesitter/nvim-treesitter-refactor',
        -- 'JoosepAlviste/nvim-ts-context-commentstring', 'windwp/nvim-ts-autotag',
        -- 'p00f/nvim-ts-rainbow'
    }
}

lang["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    config = conf.treesitter_obj,
    opt = true
}

lang["RRethy/nvim-treesitter-textsubjects"] = {
    opt = true,
    config = conf.tsubject
}

-- lang["danymat/neogen"] = {
--   opt = true,
--   config = function()
--     require("neogen").setup()
--   end,
-- }

lang["ThePrimeagen/refactoring.nvim"] = {opt = true, config = conf.refactor}

lang["nvim-treesitter/nvim-treesitter-refactor"] = {
    after = "nvim-treesitter-textobjects", -- manual loading
    config = conf.treesitter_ref, -- let the last loaded config treesitter
    opt = true
}

lang["nvim-treesitter/playground"] = {
    -- after = "nvim-treesitter",
    opt = true,
    cmd = "TSPlaygroundToggle",
    config = conf.playground
}

lang["yardnsm/vim-import-cost"] = {cmd = "ImportCost", opt = true}

-- lang['scalameta/nvim-metals'] = {requires = {"nvim-lua/plenary.nvim"}}
-- lang["lifepillar/pgsql.vim"] = {ft = {"sql", "pgsql"}}

lang["nanotee/sqls.nvim"] = {
    ft = {"sql", "pgsql"},
    setup = conf.sqls,
    opt = true
}

lang["ray-x/navigator.lua"] = {
    requires = {"ray-x/guihua.lua", run = "cd lua/fzy && make"},
    config = conf.navigator,
    opt = true
}

lang["ray-x/web-tools.nvim"] = {
    ft = {"html", "javascript"},
    opt = true,
    config = function() require('web-tools').setup() end
}

lang["gcmt/wildfire.vim"] = {
    setup = function()
        -- vim.cmd([[nmap <leader>S <Plug>(wildfire-quick-select)]])
    end,
    fn = {
        '<Plug>(wildfire-fuel)', '<Plug>(wildfire-water)',
        '<Plug>(wildfire-quick-select)'
    }
}

-- great plugin but not been maintained
-- lang["ElPiloto/sidekick.nvim"] = {opt = true, fn = {'SideKickNoReload'}, setup = conf.sidekick}
lang["stevearc/aerial.nvim"] = {
    opt = true,
    cmd = {"AerialToggle"},
    config = function()
        require("aerial").setup({
            -- Priority list of preferred backends for aerial
            backends = {"lsp", "treesitter", "markdown"},

            -- Enum: persist, close, auto, global
            --   persist - aerial window will stay open until closed
            --   close   - aerial window will close when original file is no longer visible
            --   auto    - aerial window will stay open as long as there is a visible
            --             buffer to attach to
            --   global  - same as 'persist', and will always show symbols for the current buffer
            close_behavior = "auto",

            -- Set to false to remove the default keybindings for the aerial buffer
            default_bindings = true,

            -- Enum: prefer_right, prefer_left, right, left
            -- Determines the default direction to open the aerial window. The 'prefer'
            -- options will open the window in the other direction *if* there is a
            -- different buffer in the way of the preferred direction
            default_direction = "prefer_right",

            -- A list of all symbols to display. Set to false to display all symbols.
            filter_kind = {
                "Class", "Constructor", "Enum", "Function", "Interface",
                "Method", "Struct"
            },

            -- Enum: split_width, full_width, last, none
            -- Determines line highlighting mode when multiple buffers are visible
            highlight_mode = "split_width",

            -- When jumping to a symbol, highlight the line for this many ms
            -- Set to 0 or false to disable
            highlight_on_jump = 300,

            -- Fold code when folding the tree. Only works when manage_folds is enabled
            link_tree_to_folds = true,

            -- Fold the tree when folding code. Only works when manage_folds is enabled
            link_folds_to_tree = false,

            -- Use symbol tree for folding. Set to true or false to enable/disable
            -- 'auto' will manage folds if your previous foldmethod was 'manual'
            manage_folds = "auto",

            -- The maximum width of the aerial window
            max_width = 40,

            -- The minimum width of the aerial window.
            -- To disable dynamic resizing, set this to be equal to max_width
            min_width = 10,

            -- Set default symbol icons to use Nerd Font icons (see https://www.nerdfonts.com/)
            nerd_font = "auto",

            -- Whether to open aerial automatically when entering a buffer.
            -- Can also be specified per-filetype as a map (see below)
            open_automatic = false,

            -- If open_automatic is true, only open aerial if the source buffer is at
            -- least this long
            open_automatic_min_lines = 0,

            -- If open_automatic is true, only open aerial if there are at least this many symbols
            open_automatic_min_symbols = 0,

            -- Set to true to only open aerial at the far right/left of the editor
            -- Default behavior opens aerial relative to current window
            placement_editor_edge = false,

            -- Run this command after jumping to a symbol (false will disable)
            post_jump_cmd = "normal! zz",

            -- If close_on_select is true, aerial will automatically close after jumping to a symbol
            close_on_select = false,

            lsp = {
                -- Fetch document symbols when LSP diagnostics change.
                -- If you set this to false, you will need to manually fetch symbols
                diagnostics_trigger_update = true,

                -- Set to false to not update the symbols when there are LSP errors
                update_when_errors = true
            },

            treesitter = {
                -- How long to wait (in ms) after a buffer change before updating
                update_delay = 300
            },

            markdown = {
                -- How long to wait (in ms) after a buffer change before updating
                update_delay = 300
            }
        })
    end
  }


lang["simrat39/symbols-outline.nvim"] = {
    opt = true,
    cmd = {"SymbolsOutline", "SymbolsOutlineOpen"},
    setup = conf.outline
}

lang["mfussenegger/nvim-dap"] = {config = conf.dap, opt = true} -- cmd = "Luadev",

lang["JoosepAlviste/nvim-ts-context-commentstring"] = {opt = true}

lang["rcarriga/nvim-dap-ui"] = {
    -- requires = {"mfussenegger/nvim-dap"},
    config = conf.dapui,
    cmd = "Luadev",
    opt = true
}

lang["theHamsta/nvim-dap-virtual-text"] = {opt = true, cmd = "Luadev"}

lang["nvim-telescope/telescope-dap.nvim"] = {
    config = conf.dap,
    -- cmd = "Telescope",
    opt = true
}

lang["mfussenegger/nvim-dap-python"] = {ft = {"python"}}

lang["mtdl9/vim-log-highlighting"] = {ft = {"text", "log"}}

-- lang["michaelb/sniprun"] = {
--   run = "bash install.sh",
--   opt = true,
--   cmd = {"SnipRun", "SnipReset"}
--   --   config = function() require'sniprun'.setup({
--   --   -- selected_interpreters = {},     --" use those instead of the default for the current filetype
--   --   -- repl_enable = {},               --" enable REPL-like behavior for the given interpreters
--   --   -- repl_disable = {},              --" disable REPL-like behavior for the given interpreters

--   --   inline_messages = 1             --" inline_message (0/1) is a one-line way to display messages
--   --                                   --" to workaround sniprun not being able to display anything
--   -- })
--   -- end
-- }
-- JqxList and JqxQuery json browsing, format
-- lang["gennaro-tedesco/nvim-jqx"] = {opt = true, cmd = {"JqxList", "JqxQuery"}}

lang["windwp/nvim-ts-autotag"] = {
    opt = true
    -- after = "nvim-treesitter",
    -- config = function() require"nvim-treesitter.configs".setup {autotag = {enable = true}} end
}

lang["p00f/nvim-ts-rainbow"] = {
    opt = true,
    -- after = "nvim-treesitter",
    -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    -- cmd = "Rainbow",
    config = function()
        require("nvim-treesitter.configs").setup({
            rainbow = {enable = true, extended_mode = true}
        })
    end
}

lang["folke/trouble.nvim"] = {
    cmd = {"Trouble", "TroubleToggle"},
    config = function() require("trouble").setup({}) end
}
return lang
