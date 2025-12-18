--------------------------------------------------------------------------------
-- diffview.nvim - Enhanced diff view for git
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Cycle through diffs with unified view
-- Commands:
--   :DiffviewOpen       Open diff view
--   :DiffviewClose      Close diff view
--   :DiffviewFileHistory  Show file history
-- Keymaps:
--   <leader>gD  Open Diffview
--   <leader>gh  File history
--------------------------------------------------------------------------------

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File Git History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git History (all)" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = {
        layout = "diff2_horizontal",
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
      },
      file_history = {
        layout = "diff2_horizontal",
      },
    },
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 35,
      },
    },
  },
}
