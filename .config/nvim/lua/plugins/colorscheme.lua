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
			opts.on_highlights = function(hl)
				local fgcolor = "#636da6"
				local bgcolor = "none"
				local colors = require("tokyonight.colors").setup()
				hl.MsgArea = { fg = colors.purple }
				hl.LineNrAbove = { fg = fgcolor, bg = bgcolor }
				hl.LineNrBelow = { fg = fgcolor, bg = bgcolor }
				hl.Comment = { fg = fgcolor, bg = bgcolor }
			end
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
	},
}
