local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d', { desc = "Delete word bacwards" })

-- Delete all blank lines
map("n", "<localleader>d", ":g/^$/d<CR>", { desc = "Delete all blank lines" })

-- Select all
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
-- vim.map("c", "w!!", "w !sudo tee > /dev/null %", { silent = true, desc = "Write as Sudo" })

-- Jumplist
map("n", "<C-m>", "<C-i>", opts)

-- New tab
map("n", "te", ":tabedit<CR>", { desc = "Create New Buffer Tab" })
map("n", "tc", ":tabclose<CR>", { desc = "Close Current Tab" })

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)
-- Move window
map("n", "sh", "<C-w>h", { desc = "Go To Left Window" })
map("n", "sk", "<C-w>k", { desc = "Go To Upper Window" })
map("n", "sj", "<C-w>j", { desc = "Go To Lower Window" })
map("n", "sl", "<C-w>l", { desc = "Go To Right Window" })

-- Resize window
map("n", "<C-w><left>", "<C-w><", { desc = "Decrease Window Width" })
map("n", "<C-w><right>", "<C-w>>", { desc = "Increase Window Width" })
map("n", "<C-w><up>", "<C-w>+", { desc = "Increase Window Height" })
map("n", "<C-w><down>", "<C-w>-", { desc = "Decrease Window Height" })

-- String Replacements keymaps
-- Auto Replacement
map("n", "<localleader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "String Auto Replacement" })

-- Manual Replacement
map(
	"n",
	"<localleader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "String Manual Replacement" }
)

-- Changing file permissions to executable
map("n", "<localleader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Change Script Permission to executable" })

-- Diagnostics
map("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
