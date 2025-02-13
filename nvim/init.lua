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

  -- Provided colors:
  -- A: #E4ACB2
  -- B: #EABCA8
  -- C: #FAEDCD
  -- D: #CCD5AE
  -- E: #99BAB9
  -- F: #252535
  --
  -- Assigned highlight groups:
  -- Normal:   fg = C, bg = F
  -- Statement: fg = A
  -- Comment:   fg = B (italicized)
  -- Constant:  fg = D
  -- Identifier:fg = E
  -- LineNr:    fg = A  (duplicate with Statement)
  -- Visual:    bg = B  (duplicate with Comment)

  -- Normal text
  vim.api.nvim_set_hl(0, "Normal", { fg = "#FAEDCD", bg = "#252535" })

  -- Keywords/Statements
  vim.api.nvim_set_hl(0, "Statement", { fg = "#E4ACB2" })

  -- Comments (italicized)
  vim.api.nvim_set_hl(0, "Comment", { fg = "#EABCA8", italic = true })

  -- Constants
  vim.api.nvim_set_hl(0, "Constant", { fg = "#CCD5AE" })

  -- Identifiers
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#99BAB9" })

  -- Line numbers (shares the same color as Statement)
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#E4ACB2" })

  -- Visual selection (shares the same color as Comment)
  vim.api.nvim_set_hl(0, "Visual", { bg = "#EABCA8" })
end)

