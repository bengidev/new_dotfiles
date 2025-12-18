--------------------------------------------------------------------------------
-- SwiftLint - Lint Swift code
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Neovim Configuration
-- Automatically lints Swift files for common issues
-- Requires:
--   brew install swiftlint
--
-- Keymaps:
--   <leader>ml  Manual lint current file
--------------------------------------------------------------------------------

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      swift = { "swiftlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        -- Skip swiftinterface files
        if not vim.endswith(vim.fn.bufname(), "swiftinterface") then
          lint.try_lint()
        end
      end,
    })

    vim.keymap.set("n", "<leader>ml", function()
      lint.try_lint()
    end, { desc = "Lint file" })
  end,
}
