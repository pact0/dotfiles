require 'plugins.lspconfig.handlers'
require 'plugins.lspconfig.diagnostics'
local lspconfig = require 'lspconfig'
local utils = require "utils"

local M = {}

require('vim.lsp.protocol').CompletionItemKind = {
    Text = " [text]",
    Method = " [method]",
    Function = " [function]",
    Constructor = " [constructor]",
    Field = "ﰠ [field]",
    Variable = " [variable]",
    Class = " [class]",
    Interface = " [interface]",
    Module = " [module]",
    Property = " [property]",
    Unit = " [unit]",
    Value = " [value]",
    Enum = " [enum]",
    Keyword = " [key]",
    Snippet = "﬌ [snippet]",
    Color = " [color]",
    File = " [file]",
    Reference = " [reference]",
    Folder = " [folder]",
    EnumMember = " [enum member]",
    Constant = " [constant]",
    Struct = " [struct]",
    Event = "⌘ [event]",
    Operator = " [operator]",
    TypeParameter = " [type]"
}

M.symbol_kind_icons = {
    Function = "",
    Method = "",
    Variable = "",
    Constant = "",
    Interface = "",
    Field = "ﰠ",
    Property = "",
    Struct = "",
    Enum = "",
    Class = ""
}

M.symbol_kind_colors = {
    Function = "green",
    Method = "green",
    Variable = "blue",
    Constant = "red",
    Interface = "cyan",
    Field = "blue",
    Property = "blue",
    Struct = "cyan",
    Enum = "yellow",
    Class = "red"
}

-- vim.fn
--     .sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticError"})
--
-- vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticWarn"})
--
-- vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticInfo"})
--
-- vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticHint"})

function _G.activeLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.get_active_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.P(servers)
end
function _G.bufferActiveLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.buf_get_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.P(servers)
end

-- Formatting via efm
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local luafmt = require "efm/luafmt"

local lsp_installer = require "nvim-lsp-installer"

-- Setup everything on lsp attach
local on_attach = function(client, bufnr)
    print("LSP started.");
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync({},1500)]]
        vim.api.nvim_command [[augroup END]]
    end
    if client.resolved_capabilities.goto_definition then
        utils.map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>",
                  {buffer = true})
    end
    if client.resolved_capabilities.hover then
        utils.map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>",
                  {buffer = true})
    end
    if client.resolved_capabilities.find_references then
        utils.map("n", "<Space>*",
                  ":lua require('lists').change_active('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>",
                  {buffer = true})
    end
    if client.resolved_capabilities.rename then
        utils.map("n", "<Space>rn", "<cmd>lua require'lsp.rename'.rename()<CR>",
                  {silent = true, buffer = true})
    end
    if client.resolved_capabilities.signature_help then
        utils.map("n", "<Space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                  {silent = true, buffer = true})
    end
    utils.map("n", "<Space><CR>",
              "<cmd>lua require'diagnostics'.line_diagnostics()<CR>",
              {buffer = true})

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require("lsp_signature").on_attach {
        hint_enable = false,
        hi_parameter = "QuickFixLine",
        handler_opts = {border = vim.g.floating_window_border}
    }
    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                   opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.references()<CR>',
    --                opts)
    buf_set_keymap('n', '<space>d',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                   opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                   opts)

    -- Set some keybinds conditional on server capabilities
    buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                   opts)
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                       opts)
    end

end
local languages = {
    lua = {luafmt},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    javascriptreact = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    html = {prettier},
    scss = {prettier},
    css = {prettier},
    markdown = {prettier}
    -- python = {autopep}
}
local ts_utils_attach = require 'plugins.lsp-ts-utils'
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())

lsp_installer.on_server_ready(function(server)
    local default_opts = {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false, on_attach(
                                                                   client, bufnr)
        end,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                       .protocol
                                                                       .make_client_capabilities())

    }

    local server_opts = {

        ['tsserver'] = function()
            default_opts = {
                root_dir = lspconfig.util.root_pattern("yarn.lock",
                                                       "lerna.json", ".git"),
                on_attach = function(client, bufnr)
                    -- This makes sure tsserver is not used for formatting (I prefer prettier)
                    client.resolved_capabilities.document_formatting = false
                    ts_utils_attach(client)
                    on_attach(client, bufnr)
                end,
                settings = {documentFormatting = false},
                init_options = {hostInfo = "neovim"},
                capabilities = capabilities
            }
        end,

        ['efm'] = function()
            default_opts = {
                root_dir = lspconfig.util.root_pattern {'.git/', '.'},
                init_options = {documentFormatting = true},
                settings = {
                    rootMarkers = {".git/", ".", "stylua.toml"},
                    languages = languages,
                    log_level = 1,
                    log_file = '~/efm.log'
                },
                filetypes = vim.tbl_keys(languages),
                on_attach = function(client)
                    client.resolved_capabilities.document_formatting = true
                    on_attach(client)
                end
            }
        end,
        ['phpactor'] = function()
            default_opts.on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = true
                on_attach(client, bufnr)
            end
        end,

        ['jsonls'] = function()
            default_opts.settings = {
                json = {
                    -- Schemas https://www.schemastore.org
                    schemas = {
                        {
                            fileMatch = {"package.json"},
                            url = "https://json.schemastore.org/package.json"
                        }, {
                            fileMatch = {"tsconfig*.json"},
                            url = "https://json.schemastore.org/tsconfig.json"
                        }, {
                            fileMatch = {
                                ".prettierrc", ".prettierrc.json",
                                "prettier.config.json"
                            },
                            url = "https://json.schemastore.org/prettierrc.json"
                        }, {
                            fileMatch = {".eslintrc", ".eslintrc.json"},
                            url = "https://json.schemastore.org/eslintrc.json"
                        }, {
                            fileMatch = {
                                ".babelrc", ".babelrc.json", "babel.config.json"
                            },
                            url = "https://json.schemastore.org/babelrc.json"
                        },
                        {
                            fileMatch = {"lerna.json"},
                            url = "https://json.schemastore.org/lerna.json"
                        }, {
                            fileMatch = {"now.json", "vercel.json"},
                            url = "https://json.schemastore.org/now.json"
                        }, {
                            fileMatch = {
                                ".stylelintrc", ".stylelintrc.json",
                                "stylelint.config.json"
                            },
                            url = "http://json.schemastore.org/stylelintrc.json"
                        }
                    }
                }
            }

        end,

        ['yamlls'] = function()
            default_opts.settings = {
                yaml = {
                    schemas = {
                        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
                    }
                }
            }
        end

    }
    local server_options = server_opts[server.name] and
                               server_opts[server.name]() or default_opts
    server:setup(server_options)
end)

local servers = {
    "bashls", "jsonls", "pyright", "vuels", "yamlls", "tsserver", "eslint",
    "html", "dockerls", "cssls", "prismals", "clangd", "c", "c++", "cmake",
    "lua", "vimls"
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end
