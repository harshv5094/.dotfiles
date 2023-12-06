local wezterm = require("wezterm")

local module = {}

function module.setup(config)
	-- For example, changing the color scheme
	config.color_scheme = "Campbell"

	-- Auto reloads the configurations
	config.automatically_reload_config = true

	-- Cursor Animation and fps rate
	config.default_cursor_style = "BlinkingBar"
	config.animation_fps = 60
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"

	--  window background setting
	config.config.window_background_opacity = 0.8

	-- Changing font size
	config.font_size = 11
	config.bold_brightens_ansi_colors = true
	config.default_cursor_style = "BlinkingBar"

	-- Underline config and cursor config
	config.underline_thickness = 3
	config.cursor_thickness = 4
	config.underline_position = -6

	-- Checking Updates every 24 hours
	config.check_for_updates = true
	config.check_for_updates_interval_seconds = 86400

	-- Audible Bell
	config.audible_bell = "SystemBeep"

	-- If windows use powershell as default shell
	if wezterm.target_triple:find("windows") then
		config.default_prog = { "pwsh" }
		config.window_decorations = "RESIZE|TITLE"
		wezterm.on("gui-startup", function(cmd)
			local screen = wezterm.gui.screens().active
			local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
			local gui = window:gui_window()
			local width = 0.7 * screen.width
			local height = 0.7 * screen.height
			gui:set_inner_size(width, height)
			gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
		end)
	else
		config.term = "wezterm"
		config.window_decorations = "RESIZE"
	end
end

return module
