-- NOTE: Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- NOTE: Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- HACK: Changing Cmdline Foreground Color
-- TODO: Find solution to change color when neovim is in dashboard
vim.api.nvim_create_autocmd({ "BufEnter", "CmdlineEnter", "VimEnter" }, {
	pattern = "*",
	command = "hi MsgArea guifg=#fca7ea",
})

-- HACK: Changing Cmdline Foreground Color for error message
vim.api.nvim_create_autocmd({ "BufEnter", "CmdlineEnter", "VimEnter" }, {
	pattern = "*",
	command = "hi ErrorMsg guifg=#ff757f",
})

-- HACK: Changing relative line number above color
vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
	pattern = "*",
	command = "hi LineNrAbove guifg=#636da6",
})

-- HACK: Changing relative line number below color
vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
	pattern = "*",
	command = "hi LineNrBelow guifg=#636da6",
})
