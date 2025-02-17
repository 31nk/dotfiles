-- Try to load the alpha plugin and its dashboard theme
local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
  vim.notify("alpha-nvim not found! Please ensure it's installed.", vim.log.levels.ERROR)
  return
end

local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_ok then
  vim.notify("alpha.themes.dashboard not found! This module may have been renamed or is missing.", vim.log.levels.ERROR)
  return
end

dashboard.section.header.val = {
  " ",
  "   LazyVim",
  " ",
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("o", "  Open folder", ":Telescope file_browser /home/dorian/dotfiles/ <CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
