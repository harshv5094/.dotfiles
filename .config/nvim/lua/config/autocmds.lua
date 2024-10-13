-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Changing cmdline color
-- vim.api.nvim_create_autocmd({ "BufEnter", "CmdlineEnter", "VimEnter" }, {
--   command = "hi MsgArea guifg=#fca7ea",
-- })
