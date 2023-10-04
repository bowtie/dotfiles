return {
	color_schemes = {
		["Gnome Light"] = require("gnome"),
		["Charmful Dark"] = require("charmful"),
	},
	color_scheme = "tokyonight_night";
	font = require("wezterm").font("Iosevka Nerd Font"),
	font_size = 15.2,
	default_cursor_style = "BlinkingBar",

	default_prog = { "fish" },
	window_close_confirmation = "NeverPrompt",
	hide_tab_bar_if_only_one_tab = true,

	window_padding = {
		top = "1.5cell",
		right = "2cell",
		bottom = "1.5cell",
		left = "2cell",
	},

	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	},

	window_background_opacity = 0.8,
	text_background_opacity = 1.0,

	keys = require("keys"),
}
