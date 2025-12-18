--------------------------------------------------------------------------------
-- hop.nvim - Fast cursor jump to any position
--------------------------------------------------------------------------------
-- Keymaps:
--   <leader>hw  Jump to word
--   <leader>hl  Jump to line
--   <leader>hc  Jump to character (2-char)
--   <leader>hp  Jump to pattern
--------------------------------------------------------------------------------

return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "VeryLazy",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
    quit_key = "<Esc>",
    multi_windows = true,
  },
  keys = {
    { "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop to word" },
    { "<leader>hl", "<cmd>HopLine<cr>", desc = "Hop to line" },
    { "<leader>hc", "<cmd>HopChar2<cr>", desc = "Hop to 2-char" },
    { "<leader>hp", "<cmd>HopPattern<cr>", desc = "Hop to pattern" },
  },
}
