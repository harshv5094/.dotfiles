-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file format
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Setting up relative line number and comment color
vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
	callback = function()
		local fgcolor = "#636da6"
		local bgcolor = "none"
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = fgcolor, bg = bgcolor })
		vim.api.nvim_set_hl(0, "Comment", { fg = fgcolor, bg = bgcolor })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = fgcolor, bg = bgcolor })
	end,
})
