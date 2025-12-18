--------------------------------------------------------------------------------
-- nvim-bqf - Better quickfix list
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Enhanced quickfix with preview window
-- Keymaps (in quickfix window):
--   p      Preview file in floating window
--   <Tab>  Toggle item selection
--   zn     Create new list
--   zf     Fuzzy search items
--   <C-q>  Send filtered items to new list
--------------------------------------------------------------------------------

return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    -- optional for fzf integration
    {
      "junegunn/fzf",
      build = function()
        vim.fn["fzf#install"]()
      end,
    },
  },
  config = function()
    require("bqf").setup({
      auto_enable = true,
      auto_resize_height = true,
      preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        show_title = true,
        should_preview_cb = function(bufnr, qwinid)
          local ret = true
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local fsize = vim.fn.getfsize(bufname)
          if fsize > 100 * 1024 then
            -- skip file size greater than 100k
            ret = false
          elseif bufname:match("^fugitive://") then
            -- skip fugitive buffer
            ret = false
          end
          return ret
        end,
      },
      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
      },
    })
  end,
}
