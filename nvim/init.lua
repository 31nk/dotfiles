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
  -- Enable true color support.
  vim.opt.termguicolors = true

  -- Clear any previous highlight settings.
  vim.cmd("hi clear")

  ------------------------------------------------------------------
  -- Main Syntax/Editor Colors:
  --
  -- We use #354259 as our dark background.
  -- Lighter colors are used for the foreground:
  --   * #ECE5C7 — Off-white (for main text)
  --   * #C2DED1 — Light mint (for statements, comments, identifiers)
  --   * #CDC2AE — Light beige (for constants, line numbers)
  ------------------------------------------------------------------
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ECE5C7", bg = "#354259" })
  vim.api.nvim_set_hl(0, "Statement", { fg = "#C2DED1" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#C2DED1", italic = true })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#CDC2AE" })
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#C2DED1" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#CDC2AE" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#354259" })

  ------------------------------------------------------------------
  -- Additional LazyVim / lazy.nvim UI Colors:
  --
  -- All backgrounds use the dark color (#354259)
  -- with lighter colors for the foreground elements.
  ------------------------------------------------------------------
  vim.api.nvim_set_hl(0, "LazyNormal", { fg = "#ECE5C7", bg = "#354259" })
  vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#C2DED1", bg = "#354259" })
  vim.api.nvim_set_hl(0, "LazyButton", { fg = "#C2DED1", bg = "#354259" })
  vim.api.nvim_set_hl(0, "LazyButtonActive", { fg = "#ECE5C7", bg = "#354259", bold = true })
  vim.api.nvim_set_hl(0, "LazyTitle", { fg = "#C2DED1", bg = "#354259" })
end)

vim.opt.number = true
vim.opt.relativenumber = false
