"######################################################################
" DASHBOARD
"######################################################################
let g:dashboard_disable_statusline = 1
let g:dashboard_default_executive = "telescope"
lua << EOF
local g = vim.g
g.dashboard_custom_header = {
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "                                   ",
    "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ",
    "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    "    ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆       ",
    "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    "                                   "
}


g.dashboard_custom_footer = {
    "   ",
    "Gruv"
}


g.dashboard_custom_section = {
    f = {description = {"  Find File                 SPC pf "}, command = "Telescope find_files"},
    c = {description = {"  Recents                   SPC fo "}, command = "Telescope oldfiles"},
    d = {description = {"  Find Word                 SPC ps "}, command = ":lua require\'telescope.builtin\'.grep_string{ only_sort_text = true, search = vim.fn.input(\"Grep For >\") }"},
    a = {description = {"洛 New File                  SPC fn "}, command = "DashboardNewFile"},
    e = {description = {"  Bookmarks                 SPC bm "}, command = "Telescope marks"},
    b = {description = {"  Dotfiles                  SPC vrc"}, command = ":lua require(\"telescope.builtin\").find_files({prompt_title = \"< VimRC >\",cwd = \"~/dotfiles\", find_command = {\'rg\', \'--files\', \'--hidden\', \'-g\', \'!.git\' } })"}
}
EOF
