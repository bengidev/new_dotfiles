--------------------------------------------------------------------------------
-- vista.vim - Tags/symbols sidebar
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: View and search symbols/tags in a sidebar
-- Requires: ctags (install via: brew install universal-ctags)
-- Keymaps:
--   <Space>t  Toggle Vista window
--------------------------------------------------------------------------------

return {
  "liuchengxu/vista.vim",
  cmd = { "Vista" },
  keys = {
    { "<Space>t", "<cmd>Vista!!<cr>", desc = "Toggle Vista (Tags)" },
  },
  init = function()
    -- Use nvim-lsp as the default executive
    vim.g.vista_default_executive = "nvim_lsp"

    -- Fallback to ctags if lsp not available
    vim.g.vista_executive_for = {
      markdown = "toc",
    }

    -- Icon settings
    vim.g["vista#renderer#icons"] = {
      member = "",
    }

    -- Do not echo message on command line
    vim.g.vista_echo_cursor = 0

    -- Stay in current window when vista window is opened
    vim.g.vista_stay_on_open = 0

    -- Width of vista window
    vim.g.vista_sidebar_width = 40

    -- Close vista window if it's the last window
    vim.g.vista_close_on_jump = 0

    -- Show floating window for current symbol
    vim.g.vista_floating_delay = 100
  end,
}
