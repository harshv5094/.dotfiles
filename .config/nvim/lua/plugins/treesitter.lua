return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"html",
				"css",
				"json",
				"query",
				"regex",
				"vim",
			})
		end,
	},

	-- Treesitter Context
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = function()
			local context = require("treesitter-context")
			local opts = context.setup({
				enable = true,
				multiwindow = true,
				max_lines = 0,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor",
				seperator = nil,
				zindex = 10,
				on_attach = nil,
			})
			return opts
		end,
	},
}
