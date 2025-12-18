--------------------------------------------------------------------------------
-- fzf-lua - Ultra-fast fuzzy finder
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Project-wide fuzzy finding with excellent performance
-- Keymaps:
--   <leader>ff  Find files
--   <leader>fg  Live grep (project-wide search)
--   <leader>fb  Buffers
--   <leader>fh  Help tags
--   <leader>fr  Recent files
--   <leader>fc  Command history
--------------------------------------------------------------------------------

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      -- Use 'max-perf' profile for best performance
      "max-perf",
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = "rounded",
        preview = {
          border = "border",
          wrap = "nowrap",
          hidden = "nohidden",
          vertical = "down:45%",
          horizontal = "right:50%",
          layout = "flex",
          flip_columns = 120,
        },
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
          ["ctrl-u"] = "half-page-up",
          ["ctrl-d"] = "half-page-down",
        },
      },
      files = {
        prompt = "Files❯ ",
        cwd_prompt = false,
      },
      grep = {
        prompt = "Grep❯ ",
      },
    })
  end,
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files (fzf)" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep (fzf)" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers (fzf)" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help Tags (fzf)" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent Files (fzf)" },
    { "<leader>fc", "<cmd>FzfLua command_history<cr>", desc = "Command History (fzf)" },
    { "<leader>ft", "<cmd>FzfLua btags<cr>", desc = "Buffer Tags (fzf)" },
    { "<leader>fG", "<cmd>FzfLua git_files<cr>", desc = "Git Files (fzf)" },
  },
}
