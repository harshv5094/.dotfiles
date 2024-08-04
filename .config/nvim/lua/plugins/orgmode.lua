return {
	-- Org Mode in Neovim
	{
		"nvim-orgmode/orgmode",
		event = "BufReadPre",
		dependencies = {
			{ "nvim-orgmode/org-bullets.nvim" },
		},
		ft = { "org" },
		opts = {
			org_agenda_files = "~/org/**/*",
			org_default_notes_file = "~/org/refile.org",
		},
		config = function(_, opts)
			require("orgmode").setup(opts)
		end,
	},

	{
		"nvim-orgmode/org-bullets.nvim",
		event = "BufReadPre",
		opts = {
			concealcursor = false,
			symbols = {
				-- list symbol
				list = "•",
				-- headlines can be a list
				headlines = { "◉", "○", "✸", "✿" },
				checkboxes = {
					half = { "", "@org.checkbox.halfchecked" },
					done = { "✓", "@org.keyword.done" },
					todo = { "˟", "@org.keyword.todo" },
				},
			},
		},
		config = function(_, opts)
			require("org-bullets").setup(opts)
		end,
	},
}
