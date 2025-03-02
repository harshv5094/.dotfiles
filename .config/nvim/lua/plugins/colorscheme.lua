return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = function(_, opts)
			opts.style = "moon"
			opts.light_style = "day"
			opts.transparent = true
			opts.terminal_colors = true
			opts.styles = {
				comments = { italic = true },
				keywords = { italic = true },
			}
			opts.lualine_bold = true
			-- For better performance
			opts.cache = true
		end,
	},
}
