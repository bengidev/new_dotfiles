--------------------------------------------------------------------------------
-- mini.indentscope - Animated indentation scope indicator
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Visual indicator showing current indent scope
-- Automatically highlights the scope of the current cursor position
--------------------------------------------------------------------------------

return {
  "nvim-mini/mini.indentscope",
  version = false,
  event = "VeryLazy",
  opts = {
    symbol = "▏", -- Use a thin line
    options = {
      try_as_border = true,
    },
    draw = {
      delay = 50,
      priority = 2,
    },
  },
  init = function()
    -- Disable for certain filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "dashboard",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "trouble",
        "Trouble",
        "neo-tree",
        "alpha",
        "starter",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
