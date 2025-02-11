return {
    -- Catppuccin Mocha theme
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000, -- Ensure this plugin loads first
      lazy = false, -- Load immediately
      config = function()
        -- Load the Catppuccin Mocha theme
        require("catppuccin").setup({
          flavour = "mocha", -- Set the theme to Mocha
          transparent_background = false, -- Set to true for transparency
          term_colors = true, -- Enable terminal colors
          styles = {
            comments = { "italic" }, -- Italicize comments
            conditionals = { "italic" }, -- Italicize conditionals
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
          },
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            which_key = true,
            lsp_trouble = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
              },
              underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
              },
            },
          },
        })
  
        -- Set the colorscheme
        vim.cmd("colorscheme catppuccin") -- Apply the Mocha theme
      end,
    },
  }
  