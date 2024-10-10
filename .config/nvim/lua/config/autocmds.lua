-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

local enter_group = { "BufWinEnter", "CmdlineEnter" }

-- Changing cmdline color
vim.api.nvim_create_autocmd(enter_group, {
  pattern = "*",
  command = "hi MsgArea guifg=#fca7ea",
})
-- Changing Number colors
vim.api.nvim_create_autocmd(enter_group, {
  pattern = "*",
  command = "hi LineNrAbove guifg=#828bb8",
})

vim.api.nvim_create_autocmd(enter_group, {
  pattern = "*",
  command = "hi LineNrBelow guifg=#828bb8",
})
