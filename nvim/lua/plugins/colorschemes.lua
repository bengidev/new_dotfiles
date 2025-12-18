--------------------------------------------------------------------------------
-- Additional Colorschemes from jdhao/nvim-config
--------------------------------------------------------------------------------
-- A collection of popular colorschemes with random selection capability
-- Commands:
--   :RandomColorscheme  Load a random colorscheme
--   :colorscheme <name> Load specific colorscheme
--------------------------------------------------------------------------------

return {
  -- Gruvbox Material - Most popular from jdhao
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    init = function()
      -- Set gruvbox style before loading
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
    end,
  },
  -- Other Sainnhe colorschemes
  { "sainnhe/edge", lazy = true, priority = 1000 },
  { "sainnhe/sonokai", lazy = true, priority = 1000 },
  { "sainnhe/everforest", lazy = true, priority = 1000 },
  -- Popular themes
  { "navarasu/onedark.nvim", lazy = true, priority = 1000 },
  { "EdenEast/nightfox.nvim", lazy = true, priority = 1000 },
  { "olimorris/onedarkpro.nvim", lazy = true, priority = 1000 },
  { "marko-cerovac/material.nvim", lazy = true, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = true, priority = 1000 },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = true,
    priority = 1000,
  },
}
