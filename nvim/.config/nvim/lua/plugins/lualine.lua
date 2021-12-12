local lualine = require('lualine')
local get_modified = function() return '%m' or '' end
local get_readonly = function()
    if not vim.bo.readonly then return '' end
    return '[RO]'
end
local get_session = function()
    if not vim.g.loaded_obsession then return '' end
    return '%{ObsessionStatus("\\\\o/", "_o_")}'
end
local get_spell = function()
    if not vim.wo.spell then return '' end
    return '[SP]'
end
local get_path = function() return '[' .. vim.fn.expand('%:p:h') .. ']' end
local diff_source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end
local function window() return vim.api.nvim_win_get_number(0) end
local minimal_extension = {
    sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'location', 'progress'},
        lualine_z = {'filetype'}
    },
    filetypes = {'help', 'packer', 'qf'}
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch', 'diff', {'diagnostics', sources = {'nvim_diagnostic'}}
        },
        lualine_c = {
            {'filename', file_status = false}, {get_readonly}, {get_modified},
            {get_spell}, {get_session}
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
    },
    extensions = {'fugitive', minimal_extension, 'symbols-outline'}
}
