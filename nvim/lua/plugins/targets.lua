--------------------------------------------------------------------------------
-- targets.vim - Additional text objects
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: More powerful text manipulation with additional objects
-- Text objects:
--   ci(  Change inside parentheses (standard)
--   ci)  Change inside next parentheses
--   ci(  Change inside last parentheses (with 2)
--   cI(  Change inside parentheses (exclude whitespace)
--   ca(  Change around parentheses
--   cA(  Change around parentheses (include whitespace)
-- Works with: () {} [] <> '' "" `` , . ; : + - = ~ _ * # / | \ & $
-- Separator text objects: ci, (change in comma-separated)
-- Argument text objects: cia (change in argument)
--------------------------------------------------------------------------------

return {
  "wellle/targets.vim",
  event = "VeryLazy",
}
