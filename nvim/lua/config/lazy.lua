return {
  -- Load LazyVim and set up its defaults
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },

  -- Import LazyVim extras (optional)
  { import = "lazyvim.plugins.extras.ui.mini-files" }, -- Mini file explorer

  -- Additional plugins
  { "tpope/vim-sensible" },              -- Sensible defaults for Vim
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Treesitter
  { "hrsh7th/nvim-cmp" },                 -- Auto-completion
  { "folke/which-key.nvim" },             -- Keybinding helper
  { "neovim/nvim-lspconfig" },            -- LSP support
  { "williamboman/mason.nvim" },          -- LSP/DAP installer
  { "folke/trouble.nvim" },               -- Better diagnostics & quickfix
  { "windwp/nvim-autopairs" },            -- Auto-closing pairs
  { "nvim-neo-tree/neo-tree.nvim" },      -- Alternative file explorer
  { "folke/lazydev.nvim" },               -- Development tools
  { "nvim-tree/nvim-tree.lua" },          -- File explorer (primary)
  { "junnegun/fzf.vim"},
}