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
	config.default_prog = { "pwsh" }

	-- Web GPU
	config.front_end = "OpenGL"
	config.webgpu_power_preference = "HighPerformance"

	--  Window background setting
	config.window_background_opacity = 0.8
end

return module
