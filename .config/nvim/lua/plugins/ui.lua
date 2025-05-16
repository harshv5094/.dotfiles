return {

	-- Ui Search
	{
		"folke/flash.nvim",
		enabled = false,
	},

	-- Noice UI
	{
		"folke/noice.nvim",
		enabled = false,
		event = "VeryLazy",
	},

	-- Highlight Color
	{
		"brenoprata10/nvim-highlight-colors",
		opts = function()
			local colors = require("nvim-highlight-colors")
			local opts = colors.setup({
				render = "virtual",
				virtual_symbol = "■",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = " ",
				virtual_symbol_position = "inline",
				enable_tailwind = true,
				enable_hex = true,
				enable_rgb = true,
				enable_var_usage = true,
				enable_named_colors = true,
			})
			return opts
		end,
	},

	-- Tab Line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
			},
		},
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			opts.sections.lualine_z = {
				function()
					return " " .. os.date("%I:%M:%S %p")
				end,
			}
		end,
	},

	-- File Title
	{
		"b0o/incline.nvim",
		dependencies = { "folke/tokyonight.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("tokyonight.colors").setup()
			local incline = require("incline")
			local devicons = require("nvim-web-devicons")
			local helpers = require("incline.helpers")
			incline.setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.fg_float, guifg = colors.bg_float },
						InclineNormalNC = { guibg = colors.bg_float, guifg = colors.fg_float },
					},
				},
				window = { padding = 0, margin = { vertical = 0, horizontal = 0 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified

					-- No Name for unsaved file
					if filename == "" then
						filename = "[No Name]"
					end

					-- Adding plus sign for unsaved file
					if modified then
						filename = "[+] " .. filename
					end

					local design = {
						icon and { " ", icon, " ", guifg = color, guibg = helpers.contrast_color(color) or " " },
						{ " " },
						{ filename, gui = modified and "bold,italic" or "bold" },
						{ " " },
					}

					return design
				end,
			})
		end,
	},
}
