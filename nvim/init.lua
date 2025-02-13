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

  -- Kanagawa colorscheme by Rebelot
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- ensure the theme plugin loads early
    config = function()
      require("kanagawa").setup({
        -- You can add custom options here
      })
      -- Note: We are not calling `vim.cmd("colorscheme kanagawa")` here,
      -- because LazyVim might override it later.
    end,
  },

  -- Additional plugins:
  { "tpope/vim-sensible" },                                  -- Sensible defaults for Vim
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },  -- Treesitter
  { "hrsh7th/nvim-cmp" },                                     -- Auto-completion
  { "folke/which-key.nvim" },                                 -- Keybinding helper
  { "neovim/nvim-lspconfig" },                                -- LSP support
  { "williamboman/mason.nvim" },                              -- LSP/DAP installer
  { "folke/trouble.nvim" },                                   -- Better diagnostics & quickfix
  { "windwp/nvim-autopairs" },                                -- Auto-closing pairs
  { "nvim-neo-tree/neo-tree.nvim" },                          -- Alternative file explorer
  { "folke/lazydev.nvim" },                                   -- Development tools
  { "nvim-tree/nvim-tree.lua" },                              -- File explorer (primary)
  { "junegunn/fzf.vim" },                                     -- FZF integration
})

-- Override LazyVim's default colorscheme once it's finished initializing.
require("lazyvim.util").on_very_lazy(function()
  vim.cmd("colorscheme kanagawa")
end)
