-- Setup nvim-cmp.
local cmp = require 'cmp'
local npairs = require("nvim-autopairs")

vim.opt.spell = true
vim.opt.spelllang = {'en_us'}
npairs.setup({
    check_ts = true,
    map_c_w = true -- map <c-w> to delete a pair if possible
})

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})
require("luasnip.loaders.from_vscode").load()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done',
             cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end
local cmp_compare = require "cmp_compare"
for index, value in ipairs(vim.lsp.protocol.CompletionItemKind) do
    cmp.lsp.CompletionItemKind[index] = value
end
cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },

    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert
        }),
        ['<C-p>'] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert
        }),
        ['<Down>'] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ['<Up>'] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select
        }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },

    sources = {
        {name = "path", priority_weight = 110},
        {name = "nvim_lsp", max_item_count = 20, priority_weight = 100},
        {name = "nvim_lua", priority_weight = 90},
        {name = "luasnip", priority_weight = 80}, {name = 'spell'},
        {name = 'treesitter'}, {
            name = "buffer",
            max_item_count = 5,
            priority_weight = 70,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }, {
            name = "tmux",
            max_item_count = 5,
            options = {all_panes = false},
            priority_weight = 50
        }, {
            name = "look",
            keyword_length = 5,
            max_item_count = 5,
            options = {convert_case = true, loud = true},
            priority_weight = 40
        }
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact,
            cmp.config.compare.score, cmp_compare.kind,
            cmp.config.compare.sort_text, cmp.config.compare.sort_text,
            cmp.config.compare.order
        }
    },
    formatting = {
        format = function(entry, vim_item)
            local menu_map = {
                gh_issues = "[Issues]",
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[Path]",
                luasnip = "[Snip]",
                tmux = "[Tmux]",
                look = "[Look]",
                rg = "[RG]",
                treesitter = '[TS]'
            }
            vim_item.menu = menu_map[entry.source.name] or
                                string.format("[%s]", entry.source.name)

            vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
            return vim_item
        end
    },
    documentation = {border = vim.g.floating_window_border_dark},
    experimental = {native_menu = false, ghost_text = true}

})

cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})
