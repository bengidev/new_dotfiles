--------------------------------------------------------------------------------
-- yanky.nvim - Yank ring/history
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Cycle through previous yanks
-- Keymaps:
--   <C-p>  Cycle to previous yank after paste
--   <C-n>  Cycle to next yank after paste
--   <leader>fy  Open yank history with fzf/telescope
--------------------------------------------------------------------------------

return {
  "gbprod/yanky.nvim",
  dependencies = { "kkharji/sqlite.lua" }, -- Optional: persistent history
  event = "VeryLazy",
  opts = {
    ring = {
      history_length = 100,
      storage = "shada", -- Use "sqlite" for persistent history
      sync_with_numbered_registers = true,
    },
    picker = {
      select = {
        action = nil, -- Use default action
      },
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 200,
    },
    preserve_cursor_position = {
      enabled = true,
    },
  },
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after cursor (leave cursor)" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before cursor (leave cursor)" },
    { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle to previous yank" },
    { "<C-n>", "<Plug>(YankyNextEntry)", desc = "Cycle to next yank" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    { "<leader>fy", "<cmd>YankyRingHistory<cr>", desc = "Yank History" },
  },
}
