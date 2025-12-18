--------------------------------------------------------------------------------
-- vim-eunuch - Unix commands inside Vim
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Handy file operations
-- Commands:
--   :Rename {newname}  Rename current file
--   :Delete            Delete current file
--   :Move {path}       Move current file
--   :Mkdir {dir}       Create directory
--   :Chmod {mode}      Change file permissions
--   :SudoWrite         Write file with sudo
--   :SudoEdit          Edit file with sudo
--------------------------------------------------------------------------------

return {
  "tpope/vim-eunuch",
  cmd = { "Rename", "Delete", "Move", "Mkdir", "Chmod", "SudoWrite", "SudoEdit" },
}
