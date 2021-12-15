-- fold settings
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.fillchars = "fold: "
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

vim.g.ackprg = "rg --vimgrep --no-heading --hidden --smart-case"

vim.g.SignatureForceRemoveGlobal = true

vim.opt.listchars = {
    nbsp = '⦸',
    extends = '»',
    precedes = '«',
    tab = '▷─',
    trail = '•',
    space = ' '
}
vim.opt.fillchars = {
    diff = '∙',
    eob = ' ',
    fold = '·',
    vert = ' '
}
