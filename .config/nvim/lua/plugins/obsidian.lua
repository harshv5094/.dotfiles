return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			preferred_link_style = "wiki",
			workspaces = {
				{
					name = "notebook",
					path = "~/notebook/",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			templates = {
				folder = "templates",
			},
			ui = {
				enable = true,
			},
		},
	},
}
