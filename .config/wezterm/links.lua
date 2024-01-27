local wezterm = require('wezterm')

local module = {}

---@param config Config
function module.setup(config)
	config.hyperlink_rules = wezterm.default_hyperlink_rules()
end

return module
