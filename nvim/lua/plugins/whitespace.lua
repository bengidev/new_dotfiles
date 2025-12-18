--------------------------------------------------------------------------------
-- whitespace.nvim - Show and trim trailing whitespaces
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Highlight and remove trailing whitespace
-- Keymaps:
--   <leader><Space>  Remove trailing whitespace
--------------------------------------------------------------------------------

return {
  "jdhao/whitespace.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader><Space>", "<cmd>StripTrailingWhitespace<cr>", desc = "Strip Trailing Whitespace" },
  },
}
