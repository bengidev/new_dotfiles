--------------------------------------------------------------------------------
-- SwiftFormat - Format Swift code
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Neovim Configuration
-- Auto-formats Swift files on save using SwiftFormat
-- Requires:
--   brew install swiftformat
--------------------------------------------------------------------------------

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      swift = { "swiftformat" },
    },
    format_on_save = function(bufnr)
      -- Ignore certain filetypes
      local ignore_filetypes = { "oil" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
    log_level = vim.log.levels.ERROR,
  },
}
