--------------------------------------------------------------------------------
-- vim-tmux-navigator - Seamless navigation between tmux panes and vim splits
--------------------------------------------------------------------------------
-- Use Ctrl+h/j/k/l to navigate between both tmux panes and Neovim splits
-- No need to use different keys for tmux vs Neovim!
--
-- Keymaps:
--   <C-h>  Navigate left (tmux pane or vim split)
--   <C-j>  Navigate down (tmux pane or vim split)
--   <C-k>  Navigate up (tmux pane or vim split)
--   <C-l>  Navigate right (tmux pane or vim split)
--   <C-\>  Navigate to previous pane/split
--------------------------------------------------------------------------------

return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
  },
}
