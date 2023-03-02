local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Set header
dashboard.section.header.val = {
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡟⠛⠛⠛⠛⠛⠛⠛⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣷⣶⣤⡀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⢻⣿⡟⠛⠛⠛⣿⣿⣿⣿⡟⠛⠛⠛⢻⣿⣿⣿⣿⠛⠛⠛⢻⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠘⣿⣇⠀⠀⠀⢻⣿⣿⣿⠇⠀⠀⠀⠘⣿⣿⣿⡿⠀⠀⠀⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⡀⠀⠀⢸⣿⣿⣿⠀⠀⡄⠀⠀⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣇⠀⠀⠀⣿⣿⡇⠀⢀⣷⠀⠀⢸⣿⣿⠁⠀⠀⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢠⣿⣿⣿⡀⠀⠀⢻⣿⠁⠀⢸⣿⡀⠀⠀⣿⡟⠀⠀⢸⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⣼⣿⣿⣿⣇⠀⠀⢸⡟⠀⠀⣿⣿⡇⠀⠀⢹⡇⠀⠀⣾⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣿⣿⣿⠟⠃⠀⠀⠀⣼⣿⣿⣿⣿⣿⠀⠀⠈⡇⠀⢰⣿⣿⣿⠀⠀⢸⠁⠀⢸⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⡇⠀⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⣼⣿⣿⣿⡄⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⣀⣀⣠⣿⣿⣿⣿⣇⣀⣀⣀⣰⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup (dashboard.opts)
