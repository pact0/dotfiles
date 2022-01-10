local theme = {}
local conf = require('modules.themes.config')

theme["projekt0n/github-nvim-theme"] = {
  opt = true,
  config = function()
    -- vim.cmd [[hi CursorLine guibg=#353644]]
    local styles = { "dark", "dark_default", "dimmed" }
    local v = math.random(1, #styles)
    local st = styles[v]
    require("github-theme").setup({
      function_style = "bold",
      theme_style = st,
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
      colors = { bg_statusline = "#332344" },
    })
    -- vim.cmd([[highlight StatusLine guibg='#A3B3C4']])
    vim.cmd([[highlight ColorColumn guibg='#335364']])
    vim.cmd([[doautocmd ColorScheme]])
  end,
}

theme["ray-x/aurora"] = { opt = true, config = conf.aurora }

theme["folke/tokyonight.nvim"] = {
  opt = true,
  setup = conf.tokyonight,
  config = function()
    vim.cmd [[hi CursorLine guibg=#353644]]
    vim.cmd([[colorscheme tokyonight]])
    vim.cmd([[hi TSCurrentScope guibg=#282338]])
  end,
}

theme["ayu-theme/ayu-vim"] = {
  opt = true,
  config = function()
    vim.cmd("colorscheme ayu")
    vim.cmd([[highlight StatusLine guibg='#A3B3C4']])
  vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- remove background
  vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE") -- remove background
  end,
}

theme["sainnhe/sonokai"] = { opt = true, config = conf.sonokai }

theme["rebelot/kanagawa.nvim"] = {opt = true, config= conf.kangawa}

theme["sainnhe/gruvbox-material"] = { opt = true, config = conf.gruvbox }

theme["lambdalisue/glyph-palette.vim"] = {}

return theme
