--------------------------------------------------------------------------------
-- xcodebuild.nvim - Build, Debug, and Test iOS/macOS apps
--------------------------------------------------------------------------------
-- Full-featured Xcode integration for Neovim
-- Requirements:
--   brew install xcp xcode-build-server xcbeautify rg jq coreutils
--   pipx install pymobiledevice3
--
-- Commands:
--   :XcodebuildSetup       Initial project setup
--   :XcodebuildPicker      Show all actions
--   :XcodebuildBuild       Build project
--   :XcodebuildRun         Run app
--   :XcodebuildTest        Run tests
--   :XcodebuildDebug       Debug app
--
-- Keymaps (using <leader>x prefix):
--   <leader>xp  Picker (all actions)
--   <leader>xb  Build
--   <leader>xr  Run
--   <leader>xt  Run tests
--   <leader>xT  Run test under cursor
--   <leader>xd  Debug
--   <leader>xs  Select scheme
--   <leader>xD  Select device
--   <leader>xl  Toggle logs
--   <leader>xc  Toggle code coverage
--------------------------------------------------------------------------------

return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-tree.lua", -- optional: manage project files
    "nvim-treesitter/nvim-treesitter", -- for Quick tests support
  },
  -- Only load on macOS
  enabled = function()
    return vim.fn.has("macunix") == 1
  end,
  config = function()
    require("xcodebuild").setup({
      -- Restore on start enables autoloading of last used project settings
      restore_on_start = true,

      -- Show build progress indicator in the status line
      show_build_progress_bar = true,

      -- Logs settings
      logs = {
        auto_open_on_error = true,
        auto_focus = false,
        filetype = "objc", -- syntax highlighting for logs
      },

      -- Code coverage settings
      code_coverage = {
        enabled = true,
      },

      -- Test explorer settings
      test_explorer = {
        enabled = true,
        auto_open = true, -- open test explorer on test run
      },

      -- Highlights for test marks in buffer
      marks = {
        show_signs = true,
        success_sign = "✓",
        failure_sign = "✗",
        show_test_duration = true,
      },

      -- DAP (Debug Adapter Protocol) integration
      dap = {
        -- Set to true if nvim-dap is installed
        enabled = false,
      },
    })

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Main actions
    keymap("n", "<leader>xp", "<cmd>XcodebuildPicker<cr>", { desc = "Xcode: Picker" })
    keymap("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Xcode: Build" })
    keymap("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Xcode: Build for Testing" })
    keymap("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Xcode: Build & Run" })
    keymap("n", "<leader>xR", "<cmd>XcodebuildRun<cr>", { desc = "Xcode: Run (no build)" })

    -- Testing
    keymap("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Xcode: Run Tests" })
    keymap("n", "<leader>xT", "<cmd>XcodebuildTestNearest<cr>", { desc = "Xcode: Test Nearest" })
    keymap("n", "<leader>xf", "<cmd>XcodebuildTestFile<cr>", { desc = "Xcode: Test File" })
    keymap("n", "<leader>xF", "<cmd>XcodebuildTestFailing<cr>", { desc = "Xcode: Test Failing" })

    -- Project settings
    keymap("n", "<leader>xs", "<cmd>XcodebuildSelectScheme<cr>", { desc = "Xcode: Select Scheme" })
    keymap("n", "<leader>xD", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Xcode: Select Device" })
    keymap("n", "<leader>xS", "<cmd>XcodebuildSetup<cr>", { desc = "Xcode: Setup Project" })

    -- UI toggles
    keymap("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Xcode: Toggle Logs" })
    keymap("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Xcode: Toggle Coverage" })
    keymap("n", "<leader>xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Xcode: Toggle Test Explorer" })

    -- Debugging (if nvim-dap installed)
    keymap("n", "<leader>xd", "<cmd>XcodebuildDebug<cr>", { desc = "Xcode: Debug" })
    keymap("n", "<leader>xq", "<cmd>XcodebuildCancel<cr>", { desc = "Xcode: Cancel" })
    keymap("n", "<leader>xC", "<cmd>XcodebuildClean<cr>", { desc = "Xcode: Clean" })
  end,
}
