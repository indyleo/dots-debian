local awesome, client, mouse, screen, tag, root = awesome, client, mouse, screen, tag, root
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification libraries
local naughty = require("naughty")

-- Scratchpad library
local bling = require("bling")

-- Freedesktop
local freedesktop = require("freedesktop")

-- Lain
local lain = require("lain")

-- Error handling
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end

-- My Theme For AwesomeWM
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme.lua")

-- Local stuff
local modkey = "Mod4"
local altkey = "Mod1"
local ctrlkey = "Control"

-- The Layouts
awful.layout.layouts = {
	awful.layout.suit.tile,
}

-- Scratchpads
local term_scratch = bling.module.scratchpad({
	command = "alacritty --class term",
	rule = { instance = "term" },
	sticky = true,
	autoclose = true,
	floating = true,
	geometry = { x = 450, y = 150, height = 700, width = 1000 },
	reapply = true,
	dont_focus_before_close = false,
})

local lf_scratch = bling.module.scratchpad({
	command = "alacritty -e lf --class lf",
	rule = { instance = "lf" },
	sticky = true,
	autoclose = true,
	floating = true,
	geometry = { x = 450, y = 150, height = 700, width = 1000 },
	reapply = true,
	dont_focus_before_close = false,
})

local mixer_scratch = bling.module.scratchpad({
	command = "alacritty -e pulsemixer --class mixer",
	rule = { instance = "mixer" },
	sticky = true,
	autoclose = true,
	floating = true,
	geometry = { x = 450, y = 150, height = 700, width = 1000 },
	reapply = true,
	dont_focus_before_close = false,
})

-- Window Switcher
bling.widget.window_switcher.enable({
	type = "thumbnail",
	hide_window_switcher_key = "Escape",
	minimize_key = "n",
	unminimize_key = "N",
	kill_client_key = "q",
	cycle_key = "Tab",
	previous_key = "Left",
	next_key = "Right",
	vim_previous_key = "h",
	vim_next_key = "l",
	cycleClientsByIdx = awful.client.focus.byidx,
	filterClients = awful.widget.tasklist.filter.currenttags,
})

-- Wallpaper
local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "WWW", "MSG", "MUS", "GAME", "DEV", "VIRT", "DOC", "SYS", "REC" }, s, awful.layout.layouts[1])
end)

-- Mouse bindings
root.buttons(gears.table.join())

-- Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, ctrlkey }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, ctrlkey }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	-- Standard program
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "n", function()
		local c = awful.client.restore()
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Scratchpad
	awful.key({ modkey, ctrlkey }, "t", function()
		term_scratch:toggle()
	end),
	awful.key({ modkey, ctrlkey }, "f", function()
		lf_scratch:toggle()
	end),
	awful.key({ modkey, ctrlkey }, "m", function()
		mixer_scratch:toggle()
	end),

	-- Window Switcher
	awful.key({ altkey }, "Tab", function()
		awesome.emit_signal("bling::window_switcher::turn_on")
	end)
)

clientkeys = gears.table.join(
	awful.key({ modkey, "Shift" }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, ctrlkey },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, ctrlkey }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Shift", ctrlkey }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, ctrlkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, ctrlkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)

-- Rules
awful.rules.rules = {
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Polybar
	{ rule = { instance = "polybar" }, properties = { focusable = false, border_width = false } },

	-- Vesktop
	{ rule = { instance = "vesktop" }, properties = { tag = "MSG" } },

	--
	{ rule = { instance = "" }, properties = { tag = "MUS" } },

	-- Virt-manager
	{ rule = { instance = "virt-manager" }, properties = { tag = "VIRT" } },

	-- OBS
	{ rule = { instance = "obs" }, properties = { tag = "REC" } },

	-- Heroic
	{ rule = { instance = "heroic" }, properties = { tag = "GAME" } },

	-- Prism Launcher
	{ rule = { instance = "prismrun" }, properties = { tag = "GAME" } },

	-- Lutris
	{ rule = { instance = "lutris" }, properties = { tag = "GAME" } },

	-- Steam
	{ rule = { instance = "steamwebhelper" }, properties = { tag = "GAME" } },

	-- Battel.net
	{ rule = { instance = "steam_app_0" }, properties = { tag = "GAME" } },

	-- Floorp
	{ rule = { instance = "floorp" }, properties = { tag = "WWW" } },

	-- Wezterm
	{ rule = { instance = "wezterm" }, properties = { tag = "DEV" } },

	-- Mpv
	{ rule = { instance = "gl" }, properties = { fullscreen = true } },

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA",
				"copyq",
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin",
				"Sxiv",
				"Peek",
				"Galculator",
				"Gnome-font-viewer",
				"Font-manager",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},
}

-- Signals
client.connect_signal("manage", function(c)
	if not awesome.startup then
		awful.client.setslave(c)
	end
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

-- No border for maximized clients
function border_adjust(c)
	if c.maximized then -- no borders if only 1 client visible
		c.border_width = 0
	elseif #awful.screen.focused().clients > 1 then
		c.border_width = beautiful.border_width
		c.border_color = beautiful.border_focus
	end
end

client.connect_signal("focus", border_adjust)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- Appearance Stuff
beautiful.useless_gap = 5
beautiful.notification_opacity = "100"
beautiful.notification_icon_size = 80

-- Startup Stuff
awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- Function to set a random wallpaper using xwalr
local function set_random_wallpaper()
	awful.spawn.with_shell("xwalr ~/Pictures/Wallpaper")
end

-- Set wallpaper on startup
set_random_wallpaper()

-- Optionally, change wallpaper every hour
gears.timer({
	timeout = 3600, -- 1 hour
	autostart = true,
	call_now = false,
	callback = set_random_wallpaper,
})
