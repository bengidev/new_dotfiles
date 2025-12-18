--------------------------------------------------------------------------------
-- trouble.nvim - Better diagnostics list
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Integrations
-- Shows errors and warnings in a nice panel
-- Automatically opens on Xcode build/test failures
--
-- Keymaps:
--   <leader>tt  Toggle Trouble quickfix
--   <A-d>       Jump to next issue
--   <A-s>       Jump to previous issue
--------------------------------------------------------------------------------

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>tt", "<cmd>Trouble quickfix toggle<cr>", desc = "Toggle Trouble Quickfix" },
    { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble Diagnostics" },
  },
  opts = {
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_jump = false,
    mode = "quickfix",
    severity = vim.diagnostic.severity.ERROR,
    cycle_results = false,
  },
  config = function(_, opts)
    require("trouble").setup(opts)

    -- Auto open Trouble on Xcode build/test failure
    vim.api.nvim_create_autocmd("User", {
      pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
      callback = function(event)
        if event.data.cancelled then
          return
        end
        if event.data.success then
          require("trouble").close()
        elseif not event.data.failedCount or event.data.failedCount > 0 then
          if next(vim.fn.getqflist()) then
            require("trouble").open("quickfix")
          else
            require("trouble").close()
          end
          require("trouble").refresh()
        end
      end,
    })

    -- Jump between issues
    vim.keymap.set("n", "<A-d>", "<cmd>silent cc | silent cn<cr>zz", { desc = "Jump to next issue" })
    vim.keymap.set("n", "<A-s>", "<cmd>silent cc | silent cp<cr>zz", { desc = "Jump to previous issue" })
  end,
}
