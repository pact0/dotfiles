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
        -- GIT INTEGRATION
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'tpope/vim-fugitive'
        use 'lewis6991/gitsigns.nvim'
        use 'ThePrimeagen/git-worktree.nvim'
        use 'rhysd/git-messenger.vim'
        -- use 'pwntester/octo.nvim#-features'
        use 'sindrets/diffview.nvim'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- LSP and COMPLETION
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'RishabhRD/popfix'
        use 'RishabhRD/nvim-lsputils'
        use 'nvim-lua/lsp_extensions.nvim'
        use 'onsails/lspkind-nvim'
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
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
                {'ray-x/cmp-treesitter'}, {'L3MON4D3/LuaSnip'},
                {'saadparwaiz1/cmp_luasnip'}, {'rafamadriz/friendly-snippets'},
                {'octaltree/cmp-look'}
            }
        }

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
        use 'ms-jpq/chadtree'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- MISC
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'glepnir/dashboard-nvim'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- PROJECT MANAGEMENT
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'airblade/vim-rooter'
        use 'rmagatti/auto-session'
        use 'ahmedkhalf/project.nvim'
        use 'rmagatti/session-lens'

        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        -- BARS
        -- =x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-=x=-
        use 'hoob3rt/lualine.nvim'
use 'SmiteshP/nvim-gps'


        if packer_bootstrap then require('packer').sync() end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float {
                    border = vim.g.floating_window_border
                }
            end
        },
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
    }
}

