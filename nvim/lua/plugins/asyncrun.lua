--------------------------------------------------------------------------------
-- asyncrun.vim - Async command execution
--------------------------------------------------------------------------------
-- From jdhao/nvim-config: Run commands asynchronously with quickfix output
-- Commands:
--   :AsyncRun {cmd}  Run command asynchronously
--   :AsyncStop       Stop running command
-- Keymaps:
--   <F9>  Compile & run current file (Python, Lua, C++, etc.)
--------------------------------------------------------------------------------

return {
  "skywind3000/asyncrun.vim",
  cmd = { "AsyncRun", "AsyncStop" },
  init = function()
    -- Automatically open quickfix window when asyncrun starts
    vim.g.asyncrun_open = 6

    -- Encoding for Windows command output
    if vim.fn.has("win32") == 1 then
      vim.g.asyncrun_encs = "gbk"
    end
  end,
  keys = {
    {
      "<F9>",
      function()
        local ft = vim.bo.filetype
        local file = vim.fn.expand("%")
        local cmds = {
          python = "python3 " .. file,
          lua = "lua " .. file,
          javascript = "node " .. file,
          typescript = "ts-node " .. file,
          sh = "bash " .. file,
          go = "go run " .. file,
          rust = "cargo run",
          cpp = "g++ -std=c++17 -o /tmp/a.out " .. file .. " && /tmp/a.out",
          c = "gcc -o /tmp/a.out " .. file .. " && /tmp/a.out",
        }
        local cmd = cmds[ft]
        if cmd then
          vim.cmd("AsyncRun -mode=term -pos=bottom -rows=10 " .. cmd)
        else
          vim.notify("No run command defined for filetype: " .. ft, vim.log.levels.WARN)
        end
      end,
      desc = "Run Current File",
    },
  },
}
