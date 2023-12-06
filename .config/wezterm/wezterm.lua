-- Pull in the the wezterm api
local wezterm = require("wezterm")

-- This table will hold the configurations
local config = {}

-- require("base").setup(config)
-- In newer version of wezterm, use config_builder which will
-- help provide clearer error message
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.log_info("Reloading")

-- This is where you actually apply your config choices

require("base").setup(config)
require("links").setup(config)

return config
