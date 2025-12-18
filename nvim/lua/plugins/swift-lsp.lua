--------------------------------------------------------------------------------
-- Swift LSP (sourcekit-lsp) Configuration
--------------------------------------------------------------------------------
-- From xcodebuild.nvim wiki: Neovim Configuration
-- Provides code completion, diagnostics, and LSP features for Swift
-- Requires:
--   brew install xcode-build-server
--   xcode-build-server config -workspace <xcworkspace> -scheme <scheme>
--------------------------------------------------------------------------------

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      sourcekit = {
        cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) },
        root_dir = function(filename)
          local util = require("lspconfig.util")
          return util.root_pattern("Package.swift")(filename)
            or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
            or util.find_git_ancestor(filename)
        end,
        settings = {},
      },
    },
  },
  config = function(_, opts)
    -- Only configure sourcekit if on macOS
    if vim.fn.has("macunix") ~= 1 then
      return
    end

    local lspconfig = require("lspconfig")

    -- Setup sourcekit with options
    if opts.servers and opts.servers.sourcekit then
      lspconfig.sourcekit.setup(opts.servers.sourcekit)
    end

    -- Nice diagnostic icons
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Diagnostic configuration
    vim.diagnostic.config({
      float = { border = "rounded" },
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
      },
    })
  end,
}
