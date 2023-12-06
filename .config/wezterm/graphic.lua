local wezterm = require("wezterm")
local module = {}

function module.setup(config)
	-- Cursor Animation and fps rate
	config.animation_fps = 60
	config.cursor_blink_ease_in = "Constant"
	config.cursor_blink_ease_out = "Constant"
	config.default_cursor_style = "BlinkingBar"

	-- GPU Settings
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"
end

return module
