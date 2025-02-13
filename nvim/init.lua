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
  -- Note: Using "hi clear" will reset all highlight groups.
  vim.cmd("hi clear")

  -- Set custom highlights using your provided hex codes:
  -- Normal text: foreground #EFEFEF, background #252535
  vim.api.nvim_set_hl(0, "Normal", { fg = "#EFEFEF", bg = "#252535" })

  -- Example syntax groups:
  -- Keywords/Statements in #B1E6F3
  vim.api.nvim_set_hl(0, "Statement", { fg = "#B1E6F3" })

  -- Comments in #72DDF7 (italicized)
  vim.api.nvim_set_hl(0, "Comment", { fg = "#72DDF7", italic = true })

  -- Constants in #79B8F4
  vim.api.nvim_set_hl(0, "Constant", { fg = "#79B8F4" })

  -- Identifiers in #8093F1
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#8093F1" })

  -- You can override additional highlight groups as desired:
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#72DDF7" })     -- For line numbers
  vim.api.nvim_set_hl(0, "Visual", { bg = "#8093F1" })       -- For visual selection
end)
