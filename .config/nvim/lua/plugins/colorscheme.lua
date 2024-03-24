return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
					lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
				},
			}
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
	},
}
