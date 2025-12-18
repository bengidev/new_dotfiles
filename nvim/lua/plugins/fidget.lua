--------------------------------------------------------------------------------
-- fidget.nvim - LSP progress and notifications
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Integrations
-- Shows build progress and notifications in a non-intrusive way
-- Integrates with xcodebuild.nvim for build/test progress
--------------------------------------------------------------------------------

-- Progress handle for xcodebuild notifications
local progress_handle

return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    local fidget = require("fidget")

    fidget.setup({
      notification = {
        window = {
          normal_hl = "String",
          winblend = 0,
          border = "rounded",
          zindex = 45,
          max_width = 0,
          max_height = 0,
          x_padding = 1,
          y_padding = 1,
          align = "bottom",
          relative = "editor",
        },
      },
    })

    -- Integrate with xcodebuild.nvim
    -- Override xcodebuild notify functions to use fidget
    vim.api.nvim_create_autocmd("User", {
      pattern = "XcodebuildBuildStarted",
      callback = function()
        local progress = require("fidget.progress")
        progress_handle = progress.handle.create({
          message = "Building...",
          lsp_client = { name = "xcodebuild.nvim" },
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
      callback = function(event)
        if progress_handle then
          if event.data.success then
            progress_handle.message = "Success ✓"
          else
            progress_handle.message = "Failed ✗"
          end
          progress_handle:finish()
          progress_handle = nil
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "XcodebuildTestStarted",
      callback = function()
        local progress = require("fidget.progress")
        progress_handle = progress.handle.create({
          message = "Running tests...",
          lsp_client = { name = "xcodebuild.nvim" },
        })
      end,
    })
  end,
}
