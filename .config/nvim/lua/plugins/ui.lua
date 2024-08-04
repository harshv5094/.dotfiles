return {

	-- Neovim Notification
	{
		"rcarriga/nvim-notify",
		event = "BufReadPre",
		opts = {
			timeout = 3000,
		},
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				always_show_bufferline = false,
				show_close_icon = true,
				diagnostics = "nvim_lsp",
			},
		},
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
					},
				},
				lualine_z = {
					{
						function()
							return " " .. os.date("%r")
						end,
						separator = { left = "", right = "" },
					},
				},
			},
		},
	},

	-- top right filename
	{
		"b0o/incline.nvim",
		dependencies = { "folke/tokyonight.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("tokyonight.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta2, guifg = colors.black },
						InclineNormalNC = { guifg = colors.magenta2, guibg = colors.black },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- Zen Mode 🏡
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},

	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			-- NOTE: The line below imports `banner.lua` module from the util directory
			local logo = string.rep("\n", 4) .. require("util.banner") .. "\n\n"
			opts.config.header = vim.split(logo, "\n")
			opts.config.center = {
				{
					action = "ene | startinsert",
					desc = " New File",
					icon = " ",
					key = "n",
				},
				{
					action = 'lua LazyVim.pick("oldfiles")()',
					desc = " Recent Files",
					icon = " ",
					key = "r",
				},
				{
					action = "lua LazyVim.pick.config_files()()",
					desc = " Config",
					icon = " ",
					key = "c",
				},
				{
					action = 'lua require("persistence").load()',
					desc = " Restore Session",
					icon = " ",
					key = "s",
				},
				{
					action = "Lazy",
					desc = " Lazy",
					icon = "󰒲 ",
					key = "l",
				},
				{
					action = function()
						vim.api.nvim_input("<cmd>qa<cr>")
					end,
					desc = " Quit",
					icon = " ",
					key = "q",
				},
			}
			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 50 - #button.desc)
				button.key_format = "  %s"
			end
		end,
	},
}
