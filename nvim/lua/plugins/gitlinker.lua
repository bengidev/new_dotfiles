--------------------------------------------------------------------------------
-- gitlinker.nvim - Generate GitHub permalinks
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Create shareable links to current line/selection
-- Keymaps:
--   <leader>gY  Copy permalink to clipboard (normal: current line, visual: selection)
--   <leader>gO  Open permalink in browser
--------------------------------------------------------------------------------

return {
  "ruifm/gitlinker.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("gitlinker").setup({
      opts = {
        remote = nil, -- Auto-detect remote
        add_current_line_on_normal_mode = true,
        print_url = true,
      },
      mappings = nil, -- Disable default mapping, we'll set our own
    })
  end,
  keys = {
    {
      "<leader>gY",
      function()
        require("gitlinker").get_buf_range_url("n")
      end,
      mode = "n",
      desc = "Copy Git Permalink",
    },
    {
      "<leader>gY",
      function()
        require("gitlinker").get_buf_range_url("v")
      end,
      mode = "v",
      desc = "Copy Git Permalink (selection)",
    },
    {
      "<leader>gO",
      function()
        require("gitlinker").get_buf_range_url("n", { action_callback = require("gitlinker.actions").open_in_browser })
      end,
      mode = "n",
      desc = "Open Git Permalink in Browser",
    },
    {
      "<leader>gO",
      function()
        require("gitlinker").get_buf_range_url("v", { action_callback = require("gitlinker.actions").open_in_browser })
      end,
      mode = "v",
      desc = "Open Git Permalink in Browser (selection)",
    },
  },
}
