return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- Trouble plugin configuration
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<localleader>tt",
				function()
					require("trouble").toggle({ mode = "workspace_diagnostics" })
				end,
				desc = "TroubleToggle",
			},
			{
				"<localleader>tr",
				function()
					require("trouble").refresh({ mode = "workspace_diagnostics" })
				end,
				desc = "TroubleRefresh",
			},
			{
				"<localleader>tc",
				function()
					require("trouble").close()
				end,
				desc = "TroubleClose",
			},
		},
		opts = {
			mode = { "workspace_diagnostics", "document_diagnostics" },
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "",
			},
		},
	},

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<localleader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
				desc = "Refactoring Tool",
			},
		},
		opts = {},
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<localleader>m",
				function()
					require("harpoon.mark").add_file()
					pcall(vim.notify, "The current open file is mapped", vim.log.levels.INFO, { title = "Harpoon" })
				end,
				desc = "Harpoon -> Mark the file ",
			},
			{
				"<localleader>h",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon -> Toggle Quick Menu",
			},
			{
				"<localleader>;1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Harpoon -> Go to 1st file",
			},
			{
				"<localleader>;2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Harpoon -> Go to 2nd file",
			},
			{
				"<localleader>;3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Harpoon -> Go to 3rd file",
			},
			{
				"<localleader>;>",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Harpoon -> Go to next file",
			},
			{
				"<localleader>;<",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Harpoon -> Go to previous file",
			},
		},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},

	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
}
