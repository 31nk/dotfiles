-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins with lazy.nvim
require("lazy").setup({
  -- LazyVim base configuration
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },

  -- Removed the Kanagawa colorscheme plugin to avoid conflicts

  -- Additional plugins:
  { "tpope/vim-sensible" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "hrsh7th/nvim-cmp" },
  { "folke/which-key.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "folke/trouble.nvim" },
  { "windwp/nvim-autopairs" },
  { "nvim-neo-tree/neo-tree.nvim" },
  { "folke/lazydev.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "junegunn/fzf.vim" },
})

-- Override LazyVim's colors once initialization is complete.
-- This ensures our custom highlights are applied last.
require("lazyvim.util").on_very_lazy(function()
  -- Enable true color support
  vim.opt.termguicolors = true

  -- (Optional) Clear any previous highlight settings from LazyVim.
  vim.cmd("hi clear")

  ------------------------------------------------------------------
  -- Main Syntax/Editor Colors
  ------------------------------------------------------------------
  -- Using these provided colors:
  --   #252535, #FBFFE4, #A9BFA8, #5E686D, #B3D8A8, #A3D1C6
  --
  -- Mapping:
  --   Normal:     fg = #FBFFE4, bg = #252535
  --   Statement:  fg = #A9BFA8
  --   Comment:    fg = #5E686D (italicized)
  --   Constant:   fg = #B3D8A8
  --   Identifier: fg = #A3D1C6
  --   LineNr:     fg = #A9BFA8  (same as Statement)
  --   Visual:     bg = #5E686D  (same as Comment)
  vim.api.nvim_set_hl(0, "Normal", { fg = "#FBFFE4", bg = "#252535" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#A9BFA8" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#5E686D", italic = true })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#B3D8A8" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#A3D1C6" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#A9BFA8" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#5E686D" })

  ------------------------------------------------------------------
  -- Additional LazyVim / lazy.nvim UI Colors
  ------------------------------------------------------------------
  -- Here we use the leftover colors: #FAFFC5, #3A3960, #3D8D7A
  --
  -- For example, these groups control parts of the lazy.nvim UI:
  --   - LazyNormal: The main area of lazy.nvim windows.
  --   - LazyBorder: The border surrounding lazy.nvim windows.
  --   - LazyButton: Buttons in the lazy.nvim UI.
  --   - LazyButtonActive: Active state for buttons.
  --   - LazyTitle: Titles for lazy.nvim windows.
  --
  -- Adjust the group names if your LazyVim version uses different ones.
  vim.api.nvim_set_hl(0, "LazyNormal", { fg = "#FAFFC5", bg = "#3A3960" })
  vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#3D8D7A", bg = "#3A3960" })
  vim.api.nvim_set_hl(0, "LazyButton", { fg = "#A9BFA8", bg = "#5E686D" })
  vim.api.nvim_set_hl(0, "LazyButtonActive", { fg = "#FBFFE4", bg = "#252535", bold = true })
  vim.api.nvim_set_hl(0, "LazyTitle", { fg = "#B3D8A8", bg = "#3D8D7A" })
end)

vim.opt.number = true
vim.opt.relativenumber = false

