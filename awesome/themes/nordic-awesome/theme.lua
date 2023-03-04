
--[[

   Nordic awesomewm theme

   Fork of awesome-macos https://github.com/dj95/awesome-macos
                               
--]]

local dpi = require("beautiful.xresources").apply_dpi


theme                                           = {}

theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/nordic-awesome"
theme.wallpaper                                 = theme.dir .."/wallpaper.png"
theme.font                                      = "Sans 8"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = "#ffffff"
theme.bg_normal                                 = "#373c4e"
theme.bg_focus                                  = "#464c69"
theme.fg_urgent                                 = "#FF0000"
theme.bg_urgent                                 = "#12121200"
theme.border_width                              = 0
theme.border_normal                             = "#121212"
theme.border_focus                              = "#848484"


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
theme.vol                                       = theme.dir .. "/icons/vol.png"
theme.vol_low                                   = theme.dir .. "/icons/vol_low.png"
theme.vol_no                                    = theme.dir .. "/icons/vol_no.png"
theme.vol_mute                                  = theme.dir .. "/icons/vol_mute.png"
theme.disk                                      = theme.dir .. "/icons/disk.png"
theme.ac                                        = theme.dir .. "/icons/ac.png"
theme.bat                                       = theme.dir .. "/icons/bat.png"
theme.bat_low                                   = theme.dir .. "/icons/bat_low.png"
theme.bat_no                                    = theme.dir .. "/icons/bat_no.png"
theme.play                                      = theme.dir .. "/icons/play.png"
theme.pause                                     = theme.dir .. "/icons/pause.png"

theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"

return theme
