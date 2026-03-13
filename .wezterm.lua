-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-macchiato"
-- config.font = wezterm.font("DejaVuSansM Nerd Font Mono", { weight = "Regular", italic = false })
-- config.font = wezterm.font("Fira Code Retina", { weight = "Regular", italic = false })
config.font = wezterm.font("Fira Code Retina", { weight = "Regular", italic = false })

-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.9
config.macos_window_background_blur = 1
-- config.initial_rows = 44
-- config.initial_cols = 80
config.font_size = 12

config.disable_default_key_bindings = true
config.max_fps = 120
config.native_macos_fullscreen_mode = false
-- config.native_macos_fullscreen_mode = true
config.macos_fullscreen_extend_behind_notch = true

-- config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
local mux = wezterm.mux

-- wezterm.on("gui-startup", function()
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

config.disable_default_mouse_bindings = true

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{ key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
	{ key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
}

-- Function to recompute and adjust padding
local function recompute_padding(window)
	local config_overrides = {}
	local current_window_config = window:get_config_overrides()
	local width, height = window:get_size() -- Get current size

	-- Example: Adjust padding to keep content centered on the screen
	-- You would replace these with your specific calculations for perfect centering
	local target_width = width * 0.8 -- Example: target content width
	local target_height = height * 0.8 -- Example: target content height

	local padding_x = math.max(0, (width - target_width) / 2)
	local padding_y = math.max(0, (height - target_height) / 2)

	-- Only apply overrides if something has changed to avoid unnecessary operations
	if
		current_window_config.window_padding.left ~= padding_x
		or current_window_config.window_padding.top ~= padding_y
	then
		config_overrides.window_padding = { left = padding_x, top = padding_y, right = padding_x, bottom = padding_y }
		window:set_config_overrides(config_overrides)
	end
end

-- Connect the function to the window-resized and window-config-reloaded events
wezterm.on("window-resized", recompute_padding)
wezterm.on("window-config-reloaded", recompute_padding) -- Also apply when config is reloaded
-- return {
-- }
-- and finally, return the configuration to wezterm
return config
