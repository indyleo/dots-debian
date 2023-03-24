-- Awesome Nordic Theme
local dpi = require("beautiful.xresources").apply_dpi


theme                                           = {}

theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/nordic-awesome"
theme.wallpaper                                 = theme.dir .."/background.jpg"
theme.font                                      = "Ubuntu Light 8"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = "#ffffff"
theme.bg_normal                                 = "#373c4e"
theme.bg_focus                                  = "#464c69"
theme.fg_urgent                                 = "#FF0000"
theme.bg_urgent                                 = "#12121200"
theme.border_width                              = 1
theme.border_normal                             = "#3b4252"
theme.border_focus                              = "#4c566a"


theme.useless_gap   = dpi(0)
theme.border_width  = dpi(2)
theme.border_normal = "#315159"
theme.border_focus = "#315159"
theme.border_marked = "#315159"


theme.tasklist_fg_focus                         = "#ffffff"
theme.tasklist_fg_normal                        = "#848484"
theme.tasklist_bg_focus                         = "#464c69"
theme.tasklist_fg_normal                        = "#818b91"

theme.titlebar_bg_normal                        = "#373c4e"
theme.titlebar_bg_focus                         = "#373c4e"
theme.menu_height                               = "10"
theme.menu_width                                = "150"
theme.bg_systray                                = "#373c4e"

theme.menu_height = 20
theme.menu_width  = 200

theme.tasklist_sticky                           = ""
theme.tasklist_ontop                            = ""
theme.tasklist_floating                         = ""
theme.tasklist_maximized_horizontal             = ""
theme.tasklist_maximized_vertical               = ""
theme.tasklist_disable_icon                     = true

theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.submenu_icon                              = theme.dir .."/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_unsel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.widget_bg                                 = theme.dir .. "/icons/widget_bg.png"

theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"

return theme
