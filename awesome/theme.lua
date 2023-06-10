-- Awesome Nordic Theme
local dpi = require("beautiful.xresources").apply_dpi
local theme = {}

theme.font                   = "Ubuntu Nerd Font Light 9"
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

return theme
