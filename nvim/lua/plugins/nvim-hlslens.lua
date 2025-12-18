--------------------------------------------------------------------------------
-- nvim-hlslens - Show search match index and count
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Shows [x/y] when searching to indicate position
-- Automatically activates when using /, ?, *, #, n, N
--------------------------------------------------------------------------------

return {
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  config = function()
    require("hlslens").setup({
      calm_down = true, -- Clear lens when cursor moves
      nearest_only = false, -- Show lens on all matches
      nearest_float_when = "auto", -- Show float when match is offscreen
    })

    -- Integrate with search commands
    local kopts = { noremap = true, silent = true }

    vim.keymap.set(
      "n",
      "n",
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.keymap.set(
      "n",
      "N",
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts
    )
    vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

    -- Clear search highlight with <Esc>
    vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", kopts)
  end,
}
