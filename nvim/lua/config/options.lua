--------------------------------------------------------------------------------
-- Neovim Options Configuration
--------------------------------------------------------------------------------
-- This file is automatically loaded BEFORE lazy.nvim starts.
-- It runs before any plugins are loaded, making it ideal for core Neovim settings.
--
-- Default LazyVim options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
-- NOTE: Options set here will override LazyVim defaults.
--       Only add options you want to customize.
--------------------------------------------------------------------------------

local opt = vim.opt

--------------------------------------------------------------------------------
-- LINE NUMBERS
--------------------------------------------------------------------------------
-- Display absolute line number on current line
opt.number = true

-- Display relative line numbers for other lines (helps with motion commands like 5j, 10k)
opt.relativenumber = true
