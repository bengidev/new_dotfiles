--------------------------------------------------------------------------------
-- vim-fugitive - Git integration
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Powerful Git commands inside Vim
-- Commands:
--   :G         Git status
--   :Gblame    Git blame
--   :Gdiff     Git diff
--   :Glog      Git log
--   :Gpush     Git push
--   :Gpull     Git pull
-- Keymaps:
--   <leader>gs  Git status
--   <leader>gw  Git add current file
--   <leader>gc  Git commit
--   <leader>gpl Git pull
--   <leader>gpu Git push
--------------------------------------------------------------------------------

return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
    { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git Add (stage) File" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
    { "<leader>gpl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    { "<leader>gpu", "<cmd>Git push<cr>", desc = "Git Push" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff Split" },
    { "<leader>gB", "<cmd>Git blame<cr>", desc = "Git Blame" },
    { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git Log" },
    { "<leader>gbn", ":Git checkout -b ", desc = "Git New Branch" },
    { "<leader>gbd", ":Git branch -d ", desc = "Git Delete Branch" },
  },
}
