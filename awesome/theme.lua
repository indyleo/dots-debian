-- Awesome Nordic Theme
local dpi = require("beautiful.xresources").apply_dpi
local theme = {}

theme.font                   = "Ubuntu Light 9"
theme.fg_normal              = "#ffffff"
theme.fg_focus               = "#ffffff"
theme.bg_normal              = "#373c4e"
theme.bg_focus               = "#464c69"
theme.fg_urgent              = "#FF0000"
theme.bg_urgent              = "#12121200"

theme.useless_gap            = dpi(0)
theme.border_width           = dpi(2)
theme.border_normal          = "#5E81AC"
theme.border_focus           = "#8FBCBB"
theme.border_marked          = "#5E81AC"

theme.tasklist_fg_focus      = "#ffffff"
theme.tasklist_fg_normal     = "#848484"
theme.tasklist_bg_focus      = "#464c69"
theme.tasklist_fg_normal     = "#818b91"

theme.tasklist_sticky        = ""
theme.tasklist_ontop         = ""
theme.tasklist_floating      = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""
theme.tasklist_disable_icon  = true

theme.window_switcher_widget_bg = "#3B4252EE"
theme.window_switcher_widget_border_width = 1
theme.window_switcher_widget_border_radius = 9
theme.window_switcher_widget_border_color = "#8FBCBB"
theme.window_switcher_clients_spacing = 20
theme.window_switcher_client_icon_horizontal_spacing = 5
theme.window_switcher_client_width = 150
theme.window_switcher_client_height = 250
theme.window_switcher_client_margins = 10
theme.window_switcher_thumbnail_margins = 10
theme.thumbnail_scale = false
theme.window_switcher_name_margins = 10
theme.window_switcher_name_valign = "center"
theme.window_switcher_name_forced_width = 200
theme.window_switcher_name_font = "Ubuntu 11"
theme.window_switcher_name_normal_color = "#D8DEE9"
theme.window_switcher_name_focus_color = "#BF616A"
theme.window_switcher_icon_valign = "center"
theme.window_switcher_icon_width = 40

return theme
