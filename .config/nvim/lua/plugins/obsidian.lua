return {
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = { "markdown" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				";ob",
				ft = { "markdown" },
				"<CMD>ObsidianBacklinks<CR>",
				desc = "Obsidian => Backlinks",
			},
			{
				";oc",
				ft = { "markdown" },
				"<CMD>ObsidianTOC<CR>",
				desc = "Obsidian => Table of Contents",
			},
			{
				";on",
				"<CMD>ObsidianNewFromTemplate<CR>",
				desc = "Obsidian => New Note from template",
			},
			{
				";or",
				ft = { "markdown" },
				"<CMD>ObsidianRename<CR>",
				desc = "Obsidian => Rename file",
			},
			{
				";ot",
				ft = { "markdown" },
				"<CMD>ObsidianTags<CR>",
				desc = "Obsidian => Tags",
			},
			{
				";oT",
				"<CMD>ObsidianTemplate<CR>",
				desc = "Obsidian => Templates",
			},
			{
				";ox",
				"<CMD>ObsidianQuickSwitch<CR>",
				desc = "Obsidian => QuickSwitch to notes",
			},
		},
		opts = {
			preferred_link_style = "wiki",
			notes_subdir = "fleeting",
			new_notes_location = "notes_subdir",
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
				date_format = "%b %d %Y",
				time_format = "%I:%M %p",
			},
			ui = {
				enable = true,
			},
		},
	},
}
