-- Pull in the wezterm API
local wezterm = require("wezterm")
local action = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()
local font = wezterm.font

-- This is where you actually apply your config choices
config.color_scheme = "nord"

-- Font
config.font = font("CaskaydiaCove NF")
config.font_size = 12

-- Shell
config.default_cwd = wezterm.home_dir

-- Window Stuff
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
-- config.window_decorations = "NONE"
config.use_fancy_tab_bar = true
config.enable_tab_bar = true

-- Blur
config.window_background_opacity = 0.85

config.window_padding = {
	left = "15",
	right = "15",
	top = "15",
	bottom = "15",
}

-- Keybinds
config.leader = { key = "Space", mods = "CTRL" }
config.keys = {
	-- Tabs
	{ -- Making Tabs
		key = "t",
		mods = "LEADER",
		action = action({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }),
	},
	{ -- Navagating Tabs
		key = "n",
		mods = "LEADER",
		action = action({ ActivateTabRelative = 1 }),
	},
	{
		key = "p",
		mods = "LEADER",
		action = action({ ActivateTabRelative = -1 }),
	},
	{ -- Kill Tabs
		key = "x",
		mods = "LEADER",
		action = action({ CloseCurrentTab = { confirm = false } }),
	},
	-- Panes
	{ -- Making Panes
		key = "\\",
		mods = "LEADER",
		action = action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{ -- Navagating Panes
		key = "h",
		mods = "LEADER|SHIFT",
		action = action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "l",
		mods = "LEADER|SHIFT",
		action = action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "k",
		mods = "LEADER|SHIFT",
		action = action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "j",
		mods = "LEADER|SHIFT",
		action = action({ ActivatePaneDirection = "Down" }),
	},
	{ -- Cycle through Pane
		key = "n",
		mods = "LEADER|ALT",
		action = action({ ActivatePaneDirection = "Next" }),
	},
	{
		key = "p",
		mods = "LEADER|ALT",
		action = action({ ActivatePaneDirection = "Prev" }),
	},
	{ -- Size the Pane
		key = "h",
		mods = "LEADER|ALT",
		action = action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "l",
		mods = "LEADER|ALT",
		action = action({ AdjustPaneSize = { "Right", 1 } }),
	},
	{
		key = "k",
		mods = "LEADER|ALT",
		action = action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "j",
		mods = "LEADER|ALT",
		action = action({ AdjustPaneSize = { "Down", 1 } }),
	},
	{ -- Kill Panes
		key = "x",
		mods = "LEADER|SHIFT",
		action = action({ CloseCurrentPane = { confirm = false } }),
	},
}

return config
