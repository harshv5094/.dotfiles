return {
	--  Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				";F",
				function()
					require("telescope.builtin").grep_string({
						search = vim.fn.input("Grep > "),
					})
				end,
				desc = "Telescope -> Grep String",
			},
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Telescope -> Find Plugin File",
			},
			{
				";r",
				function()
					require("telescope.builtin").live_grep({
						additional_args = { "--hidden" },
					})
				end,
				desc = "Telescope -> Live Grep",
			},
			{
				";h",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Telescope -> Help Guide",
			},
			{
				";;",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Telescope -> Resume Previous Buffer",
			},
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						select_buffer = true,
						cwd = telescope_buffer_dir(),
						cwd_to_path = true,
						respect_gitignore = false,
						follow_symlinks = true,
						hidden = true,
						grouped = true,
						previewer = true,
						initial_mode = "normal",
					})
				end,
				desc = "Telescope -> File Browser",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = telescope.extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})
			opts.extensions = {
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = fb_actions.change_cwd,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		--- @type TodoComments.Config
		opts = {
			signs = true,
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
		},
	},

	-- Color Highlighter
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			local colorizer = require("colorizer")
			colorizer.setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				-- css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				-- css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode.
			})
		end,
	},

	-- Git
	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	-- For Vim Practice
	{
		"theprimeagen/vim-be-good",
		lazy = true,
		event = "BufReadPre",
		keys = {
			{
				"<leader>tv",
				"<cmd>VimBeGood<Enter>",
				desc = "VimBeGood",
			},
		},
	},

	-- Vertical toggle terminal
	{
		"akinsho/toggleterm.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>tt",
				"<cmd>ToggleTerm direction=horizontal size=10<Return>",
				desc = "Toggle Terminal",
			},
		},
		opts = {},
	},
}
