local discipline = require("harsh.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', { desc = "Delete word bacwards" })

-- Select all
-- keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<CR>", { desc = "Create New Buffer Tab" })
keymap.set("n", "tc", ":tabclose<CR>", { desc = "Close Current Tab" })

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = "Go To Left Window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Go To Upper Window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Go To Lower Window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Go To Right Window" })

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Decrease Window Width" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Increase Window Width" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Increase Window Height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Decrease Window Height" })

-- String Replacement
keymap.set(
	"n",
	"<localleader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "String Replacement" }
)

-- Changing file permissions to executable
keymap.set("n", "<localleader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
	require("harsh.hsl").replaceHexWithHSL()
end, { desc = "replaceHexWithHSL" })

keymap.set("n", "<leader>i", function()
	require("harsh.lsp").toggleInlayHints()
end, { desc = "toggleInlayHints" })

-- Todo comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next({ keywords = {
		"ERROR",
		"WARNING",
	} })
end, { desc = "Next error/warning todo comment" })
