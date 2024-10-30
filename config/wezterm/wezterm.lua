local wezterm = require("wezterm")
local lackluster = require("colors.lackluster")

local config = wezterm.config_builder()

-- tab bar
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false

-- colors
config.color_schemes = lackluster
config.color_scheme = "Lackluster"
config.color_scheme_dirs = { "." }

local lackluster_scheme = lackluster["Lackluster"]
config.colors = {
	tab_bar = {
		background = lackluster_scheme.background,
		active_tab = {
			bg_color = "#7788AA",
			fg_color = lackluster_scheme.foreground,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = lackluster_scheme.background,
			fg_color = lackluster_scheme.foreground,
			intensity = "Half",
		},
	},
}

-- fonts
config.font =
	wezterm.font("Ark Pixel 16px monospaced latin", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 24

-- misc
config.window_close_confirmation = "NeverPrompt"

wezterm.on("update-status", function(window, pane)
	local time = wezterm.strftime("%H:%M")

	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	local cwd = pane:get_current_working_dir()
	cwd = basename(cwd.path) or ""
	local cmd = basename(pane:get_foreground_process_name()) or ""

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = lackluster_scheme.foreground } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))

	window:active_tab():set_title(cwd)
end)

return config
