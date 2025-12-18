--------------------------------------------------------------------------------
-- nvim-dap - Debug Adapter Protocol for iOS/macOS debugging
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Integrations
-- Enables debugging with breakpoints, stepping, and variable inspection
--
-- Keymaps:
--   <leader>dd  Build & Debug
--   <leader>dr  Debug without building
--   <leader>dt  Debug tests
--   <leader>dT  Debug class tests
--   <leader>b   Toggle breakpoint
--   <leader>B   Toggle message breakpoint
--   <leader>dx  Terminate debugger
--------------------------------------------------------------------------------

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      config = function()
        require("dapui").setup({
          controls = {
            element = "repl",
            enabled = true,
          },
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              position = "left",
              size = 40,
            },
            {
              elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
              },
              position = "bottom",
              size = 10,
            },
          },
        })
      end,
    },
  },
  -- Only load on macOS
  enabled = function()
    return vim.fn.has("macunix") == 1
  end,
  config = function()
    local xcodebuild = require("xcodebuild.integrations.dap")
    xcodebuild.setup()

    -- Xcode debug keymaps
    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Xcode: Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Xcode: Debug Without Building" })
    vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Xcode: Debug Tests" })
    vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Xcode: Debug Class Tests" })
    vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })

    -- DAP UI keymaps
    vim.keymap.set("n", "<leader>du", function()
      require("dapui").toggle()
    end, { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<leader>de", function()
      require("dapui").eval()
    end, { desc = "DAP Eval" })

    -- Auto open/close dapui
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
