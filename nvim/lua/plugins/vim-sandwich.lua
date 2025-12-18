--------------------------------------------------------------------------------
-- vim-sandwich - Surround text with pairs
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Smart surround operations (add/delete/replace pairs)
-- Keymaps:
--   sa{motion}{char}  Add surrounding char (e.g., saiw" adds " around word)
--   sd{char}          Delete surrounding char (e.g., sd" deletes ")
--   sr{char}{char}    Replace surrounding (e.g., sr"' replaces " with ')
-- Note: Uses 's' prefix instead of default vim 's' (use 'cl' instead)
--------------------------------------------------------------------------------

return {
  "machakann/vim-sandwich",
  event = "VeryLazy",
  init = function()
    -- Map s to nop since s is used by vim-sandwich. Use cl instead of s.
    vim.keymap.set("n", "s", "<Nop>", { noremap = true })
    vim.keymap.set("o", "s", "<Nop>", { noremap = true })
  end,
  config = function()
    -- Use default recipes plus some additions
    vim.cmd([[
      " Enable default key mappings
      runtime macros/sandwich/keymap/surround.vim
    ]])
  end,
}
