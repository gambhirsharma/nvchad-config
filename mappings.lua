local M = {}

M.general = {
  n = {
    ['<leader>qq'] ={":qall!<CR>","exit vim", opts={nowait = true}},
  },
  i = {
    ['jj'] = {"<ESC>","escape insert mode", opts = {nowait = true}},
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M
