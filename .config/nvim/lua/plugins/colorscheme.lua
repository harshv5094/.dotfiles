return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = function(_, opts)
			opts.transparent = true
			opts.style = "moon"
			opts.terminal_colors = true
			opts.styles = {
				comments = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			}
			opts.lualine_bold = true -- When `true`, section headers in the lualine theme will be bold
		end,
	},
}
