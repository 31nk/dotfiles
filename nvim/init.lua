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
  { "goolord/alpha-nvim" },
})

-- Override LazyVim's colors and settings once initialization is complete.
-- This ensures our custom highlights and relative line numbers are applied last.
require("lazyvim.util").on_very_lazy(function()
  -- Enable true color support.
  vim.opt.termguicolors = true

  -- Enable line numbers with relative numbers.
  vim.opt.number = true
  vim.opt.relativenumber = false

  -- Clear any previous highlight settings.
  vim.cmd("hi clear")

  ------------------------------------------------------------------
  -- Main Syntax/Editor Colors:
  --
  -- Background: #101010
  -- Normal text: #FFFFFF
  -- Statements: #F5A191
  -- Comments:   #A0A0A0 (italicized)
  -- Constants:  #E6B99D
  -- Identifiers: #E29ECA
  -- LineNr:     #7E7E7E
  ------------------------------------------------------------------
  vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = "#101010" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#F5A191" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#A0A0A0", italic = true })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#E6B99D" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#E29ECA" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#7E7E7E" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#90B99F" }) -- Visual selection

  ------------------------------------------------------------------
  -- Additional LazyVim / lazy.nvim UI Colors:
  --
  -- Using the same background (#101010) and our chosen foreground
  -- for consistency.
  ------------------------------------------------------------------
  vim.api.nvim_set_hl(0, "LazyNormal", { fg = "#FFFFFF", bg = "#101010" })
  vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#F5A191", bg = "#101010" })
  vim.api.nvim_set_hl(0, "LazyButton", { fg = "#F5A191", bg = "#101010" })
  vim.api.nvim_set_hl(0, "LazyButtonActive", { fg = "#FFFFFF", bg = "#101010", bold = true })
  vim.api.nvim_set_hl(0, "LazyTitle", { fg = "#F5A191", bg = "#101010" })

require("user.alpha")
require("user.colors")
end)
