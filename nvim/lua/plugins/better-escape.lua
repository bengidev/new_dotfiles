--------------------------------------------------------------------------------
-- better-escape.vim - Faster insert mode escape
--------------------------------------------------------------------------------
-- Escape insert mode quickly with "jk" or "jj"
-- Uses timeout to avoid lag when typing words containing these sequences
--------------------------------------------------------------------------------

return {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  opts = {
    timeout = 200,  -- Time in ms to wait for second key
    default_mappings = false,
    mappings = {
      i = {
        j = {
          k = "<Esc>",  -- jk to escape
          j = "<Esc>",  -- jj to escape
        },
        k = {
          k = "<Esc>",  -- kk to escape
        },
      },
    },
  },
}
