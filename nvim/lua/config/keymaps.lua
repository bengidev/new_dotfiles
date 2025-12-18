-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- jdhao-style keymaps from https://github.com/jdhao/nvim-config

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
-- File Operations
--------------------------------------------------------------------------------
-- Quick save
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
-- Quit current window
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })
-- Quit all windows
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
-- Copy entire buffer to clipboard
keymap("n", "<leader>y", "<cmd>%y+<cr>", { desc = "Copy entire buffer" })

--------------------------------------------------------------------------------
-- Editing
--------------------------------------------------------------------------------
-- Reselect last pasted text
keymap("n", "<leader>v", "`[v`]", { desc = "Reselect pasted text" })
-- Move lines up/down (Alt+j/k)
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
-- Turn word under cursor to upper case in insert mode
keymap("i", "<C-u>", "<Esc>viwUea", { desc = "Word to uppercase" })
-- Turn word under cursor to title case in insert mode
keymap("i", "<C-t>", "<Esc>b~lea", { desc = "Word to titlecase" })

--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------
-- Go to buffer by count (e.g., 2gb goes to buffer 2)
keymap("n", "gb", function()
  local count = vim.v.count
  if count > 0 then
    vim.cmd("buffer " .. count)
  else
    vim.cmd("bnext")
  end
end, { desc = "Go to buffer [count] or next" })

-- Scroll up/down
keymap("n", "<C-j>", "<C-d>", { desc = "Scroll down" })
keymap("n", "<C-k>", "<C-u>", { desc = "Scroll up" })

-- Edit nvim config
keymap("n", "<leader>ev", "<cmd>tabedit $MYVIMRC<cr>", { desc = "Edit nvim config" })
-- Reload nvim config
keymap("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>", { desc = "Reload nvim config" })

--------------------------------------------------------------------------------
-- Window Management
--------------------------------------------------------------------------------
-- Toggle cursor column
keymap("n", "<leader>cl", "<cmd>set cursorcolumn!<cr>", { desc = "Toggle cursor column" })
-- Change current working directory to buffer's directory
keymap("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "CD to current file" })

--------------------------------------------------------------------------------
-- Buffer Operations
--------------------------------------------------------------------------------
-- Close current buffer and go to previous
keymap("n", "\\d", "<cmd>bprevious<cr><cmd>bdelete #<cr>", { desc = "Close buffer" })
-- Close location or quickfix window
keymap("n", "\\x", function()
  local qf_winid = vim.fn.getloclist(0, { winid = 0 }).winid
  if qf_winid > 0 then
    vim.cmd("lclose")
  else
    vim.cmd("cclose")
  end
end, { desc = "Close quickfix/location" })

--------------------------------------------------------------------------------
-- Text Objects (whole buffer)
--------------------------------------------------------------------------------
-- Operate on entire buffer (yiB, diB, ciB, viB)
keymap("o", "iB", ":<C-u>normal! ggVG<cr>", { desc = "Inner buffer" })
keymap("x", "iB", ":<C-u>normal! ggVG<cr>", { desc = "Inner buffer" })

--------------------------------------------------------------------------------
-- Function Keys
--------------------------------------------------------------------------------
-- Toggle spell check
keymap("n", "<F11>", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
-- Toggle paste mode
keymap("n", "<F12>", "<cmd>set paste!<cr>", { desc = "Toggle paste mode" })

-- NOTE: jj/kk escape handled by better-escape.nvim plugin
