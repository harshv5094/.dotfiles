return {
	-- LSP Manager (Mason)
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	-- LSP completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
			local cmp = require("cmp")
			opts.window = {
				completion = cmp.config.window.bordered({}),
				documentation = cmp.config.window.bordered({}),
			}
			opts.view = {
				follow_cursor = true,
			}
		end,
	},

	-- Configuring LSP
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				cssls = {},
				html = {},
			},
		},
	},
}
