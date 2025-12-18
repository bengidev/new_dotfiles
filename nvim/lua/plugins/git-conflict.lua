--------------------------------------------------------------------------------
-- git-conflict.nvim - Visual git conflict resolution
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Highlight and resolve git merge conflicts
-- Keymaps:
--   co  Choose ours (current change)
--   ct  Choose theirs (incoming change)
--   cb  Choose both
--   c0  Choose none
--   ]x  Jump to next conflict
--   [x  Jump to previous conflict
--------------------------------------------------------------------------------

return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    default_mappings = true, -- Use default mappings
    default_commands = true, -- Use default commands
    disable_diagnostics = false,
    list_opener = "copen",
    highlights = {
      incoming = "DiffAdd",
      current = "DiffText",
    },
  },
}
