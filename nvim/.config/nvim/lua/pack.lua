local map = require'utils'.map
local leader = " "
vim.cmd [[packadd cfilter]]

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup {
    function(use)

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- THEME
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {
            "ellisonleao/gruvbox.nvim",
            requires = {"rktjmp/lush.nvim"},
            config = function()
                vim.o.background = "dark" -- or "light" for light mode
                vim.cmd([[colorscheme gruvbox]])
            end
        }

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- GIT INTEGRATION
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'tpope/vim-fugitive'
        use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
        use 'ThePrimeagen/git-worktree.nvim'
        use 'rhysd/git-messenger.vim'
        -- use 'pwntester/octo.nvim#-features'
        use 'sindrets/diffview.nvim'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- LSP and COMPLETION
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'

        use 'RishabhRD/popfix'
        use 'RishabhRD/nvim-lsputils'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'onsails/lspkind-nvim'
        use 'ray-x/lsp_signature.nvim'
        use 'glepnir/lspsaga.nvim'
        use 'jose-elias-alvarez/nvim-lsp-ts-utils'

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                {'hrsh7th/cmp-nvim-lsp'}, {'andersevenrud/cmp-tmux'},
                {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-nvim-lua'},
                {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
                {'hrsh7th/cmp-cmdline'}, {'f3fora/cmp-spell'},
                {'ray-x/cmp-treesitter'}, {'saadparwaiz1/cmp_luasnip'},
                {'octaltree/cmp-look'}
            }
        }
        use 'rafamadriz/friendly-snippets'
        use 'L3MON4D3/LuaSnip'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- FASTER START
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {
            'nathom/filetype.nvim',
            config = function()
                require("filetype").setup({
                    overrides = {
                        extensions = {
                            -- Set the filetype of *.pn files to potion
                            pn = "potion"
                        },
                        literal = {
                            -- Set the filetype of files named "MyBackupFile" to lua
                            MyBackupFile = "lua"
                        },
                        complex = {
                            -- Set the filetype of any full filename matching the regex to gitconfig
                            [".*git/config"] = "gitconfig" -- Included in the plugin
                        },

                        -- The same as the ones above except the keys map to functions
                        function_extensions = {
                            ["cpp"] = function()
                                vim.bo.filetype = "cpp"
                                -- Remove annoying indent jumping
                                vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
                            end,
                            ["pdf"] = function()
                                vim.bo.filetype = "pdf"
                                -- Open in PDF viewer (Skim.app) automatically
                                vim.fn.jobstart(
                                    "open -a skim " .. '"' .. vim.fn.expand("%") ..
                                        '"')
                            end
                        },
                        function_literal = {
                            Brewfile = function()
                                vim.cmd("syntax off")
                            end
                        },
                        function_complex = {
                            ["*.math_notes/%w+"] = function()
                                vim.cmd("iabbrev $ $$")
                            end
                        },

                        shebang = {
                            -- Set the filetype of files with a dash shebang to sh
                            dash = "sh"
                        }
                    }
                })
            end

        }
        use 'lewis6991/impatient.nvim'
        use 'tweekmonster/startuptime.vim'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- QUICKFIX LIST
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'romainl/vim-qf'
        use 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
        use 'kevinhwang91/nvim-bqf'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- TREESITTER
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

        use 'nvim-treesitter/playground'
        use 'tree-sitter/tree-sitter-cpp'
        use 'nvim-treesitter/nvim-treesitter-refactor'
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use 'nvim-neorg/tree-sitter-norg'
        use 'David-Kunz/treesitter-unit'
        use 'windwp/nvim-ts-autotag'
        use 'p00f/nvim-ts-rainbow'
        -- use 'spywhere/detect-language.nvim'
        use 'MDeiml/tree-sitter-markdown'
        use 'styled-components/vim-styled-components'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- NAVIGATION
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {
            'numToStr/Navigator.nvim',
            config = function() require('Navigator').setup() end
        }
        use 'ggandor/lightspeed.nvim'
        use 'wellle/targets.vim'
        use 'michaeljsmith/vim-indent-object'
        use 'andymass/vim-matchup'
        use 'haya14busa/incsearch.vim'
        use 'ThePrimeagen/harpoon'
        use {'ms-jpq/chadtree', run = {"CHADdeps"}}

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- MISC
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- use {
        --     'szw/vim-maximizer',
        --     config = function()
        --         vim.g.maximizer_set_default_mapping = 0
        --         map("n", leader .. "m", "<cmd>MaximizerToggle<CR>")
        --
        --     end
        -- }

        use 'voldikss/vim-floaterm'
        use 'windwp/nvim-autopairs'
        use {
            'simnalamburt/vim-mundo',
            config = function()
                -- vim.g.mundo_width = 60
                -- vim.g.mundo_preview_height = 20
                -- vim.g.mundo_right = 1
                -- map("n", leader .. "u", "<cmd>MundoToggle<CR>")
            end
        }
        use 'lambdalisue/suda.vim' -- edit sudo
        use 'folke/zen-mode.nvim'
        use 'glepnir/dashboard-nvim'
        use 'lukas-reineke/indent-blankline.nvim'
        -- use {
        --     "rrethy/vim-hexokinase",
        --     run = "make hexokinase",
        --     config = function()
        --         vim.g.Hexokinase_highlighters = {'foregroundfull'}
        --         vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"
        --     end
        -- }
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup({
                    pre_hook = function(ctx)
                        local U = require 'Comment.utils'
                        local location = nil
                        if ctx.ctype == U.ctype.block then
                            location =
                                require('ts_context_commentstring.utils').get_cursor_location()
                        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion ==
                            U.cmotion.V then
                            location =
                                require('ts_context_commentstring.utils').get_visual_start_location()
                        end
                        return
                            require('ts_context_commentstring.internal').calculate_commentstring {
                                key = ctx.ctype == U.ctype.line and '__default' or
                                    '__multiline',

                                location = location
                            }
                    end
                })
            end
        }
        use {
            "folke/todo-comments.nvim",
            requires = {"nvim-lua/plenary.nvim", 'BurntSushi/ripgrep'}
        }
        use {
            'kyazdani42/nvim-web-devicons',
            config = function()
                require'nvim-web-devicons'.setup {
                    override = {
                        zsh = {
                            icon = "",
                            color = "#428850",
                            cterm_color = "65",
                            name = "Zsh"
                        }
                    },
                    default = true
                }
            end
        }
        use {
            'ryanoasis/vim-devicons',
            config = function() vim.opt.encoding = "UTF-8" end
        }

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- PROJECT MANAGEMENT
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'airblade/vim-rooter'
        use 'ahmedkhalf/project.nvim'
        use {
            'rmagatti/session-lens',
            requires = {
                'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'
            },
            config = function()
                require('session-lens').setup({ --[[your custom config--]] })
            end
        }

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- BARS
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'hoob3rt/lualine.nvim'
        use 'SmiteshP/nvim-gps'
        use 'romgrk/barbar.nvim'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- REPLACE SEARCH SURROUND
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'machakann/vim-sandwich'
        use 'tpope/vim-surround'
        use 'tpope/vim-abolish'
        use 'tpope/vim-repeat'
        use 'vim-scripts/UnconditionalPaste'
        use 'bkad/CamelCaseMotion'
        use 'monaqa/dial.nvim'
        use({
            'sQVe/sort.nvim',
            config = function() require("sort").setup({}) end
        })

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- DEBUGGER
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
        use 'nvim-telescope/telescope-dap.nvim'
        use {
            'theHamsta/nvim-dap-virtual-text',
            config = function()
                require("nvim-dap-virtual-text").setup {
                    enabled = true, -- enable this plugin (the default)
                    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true, -- show stop reason when stopped for exceptions
                    commented = false, -- prefix virtual text with comment string
                    -- experimental features:
                    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
                    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }
            end
        }

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- TESTS
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use {
            "rcarriga/vim-ultest",
            requires = {{"vim-test/vim-test"}, {"tpope/vim-dispatch"}},
            run = ":UpdateRemotePlugins"
        }

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- TELESCOPE
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- use 'nvim-lua/plenary.nvim'
        -- use 'nvim-lua/popup.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        -- use 'nvim-telescope/telescope-fzf-writer.nvim'
        use {
            'nvim-telescope/telescope-media-files.nvim',
            require = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }
        use 'nvim-telescope/telescope-project.nvim'

        if packer_bootstrap then require('packer').sync() end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float {
                    border = vim.g.floating_window_border
                }
            end
        }
        -- Move to lua dir so impatient.nvim can cache it
        -- compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
    }
}

