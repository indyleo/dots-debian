###########################
#     My Picom Config     #
###########################

# Shadows
shadow = true;
shadow-radius = 7;
shadow-opacity = 0.75
shadow-offset-x = -7;
shadow-offset-y = -7;
shadow-color = "#000000"
shadow-exclude = [
  "name = 'Notification'",
  "class_g = 'Conky'",
  "class_g = 'Notify-osd'",
  "class_g = 'Cairo-clock'",
  "_GTK_FRAME_EXTENTS@:c"
];
clip-shadow-above = [];
shadow-exclude-reg = ""
xinerama-shadow-crop = false;

# Fading
fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;
fade-delta = 10;
fade-exclude = [];
no-fading-openclose = false;
no-fading-destroyed-argb = false;

# Transparentness
inactive-opacity = 1.0;
frame-opacity = 0.7;
inactive-opacity-override = false;
active-opacity = 1.0;
inactive-dim = 0.0;
detect-client-opacity = true;
inactive-dim-fixed = 1.0;
opacity-rule = ["100:class_g = 'firefox'"];
# transparent-clipping = false;

# Rounded Corners
corner-radius = 0;
detect-rounded-corners = true;
rounded-corners-exclude = [
  "window_type = 'dock'",
  "window_type = 'desktop'"
];

# Bluring
blur-method = "dual_kawase";
blur-size = 8;
# blur-deviation = true;
blur-strength = 2;
blur-background = true;
# blur-background-frame = false;
# blur-background-fixed = false;
blur-kern = "3x3box";
blur-background-exclude = [
  "window_type = 'dock'",
  "window_type = 'desktop'",
  "_GTK_FRAME_EXTENTS@:c"
];

# General
# daemon = false;
# dbus = false;
# force-win-blend = false;
# no-ewmh-fullscreen = false;
# max-brightness = 1.0;
# invert-color-include = [];
# use-ewmh-active-win = false;
# unredir-if-possible = false;
# unredir-if-possible-delay = 0;
# unredir-if-possible-exclude = [];
# detect-client-leader = false;

# GLX Backend
backend = "glx";
glx-no-stencil = true;
xrender-sync-fence = true;
use-damage = true;
glx-no-rebind-pixmap = false;
vsync = true;
# resize-damage = 1;
# glx-fshader-win = "";

# Focus
mark-wmwin-focused = true;
mark-ovredir-focused = true;
focus-exclude = [ "class_g = 'Cairo-clock'"];
detect-transient = true;

# Debug
log-level = "warn";
# log-file = "/path/to/your/log/file"
# show-all-xerrors = false
# write-pid-path = "/path/to/your/log/file"

# Window type settings
#
# 'WINDOW_TYPE' is one of the 15 window types defined in EWMH standard:
#     "unknown", "desktop", "dock", "toolbar", "menu", "utility",
#     "splash", "dialog", "normal", "dropdown_menu", "popup_menu",
#     "tooltip", "notification", "combo", and "dnd".
#
# Following per window-type options are available: ::
#
#   fade, shadow:::
#     Controls window-type-specific shadow and fade settings.
#
#   opacity:::
#     Controls default opacity of the window type.
#
#   focus:::
#     Controls whether the window of this type is to be always considered focused.
#     (By default, all window types except "normal" and "dialog" has this on.)
#
#   full-shadow:::
#     Controls whether shadow is drawn under the parts of the window that you
#     normally won't be able to see. Useful when the window has parts of it
#     transparent, and you want shadows in those areas.
#
#   clip-shadow-above:::
#     Controls wether shadows that would have been drawn above the window should
#     be clipped. Useful for dock windows that should have no shadow painted on top.
#
#   redir-ignore:::
#     Controls whether this type of windows should cause screen to become
#     redirected again after been unredirected. If you have unredir-if-possible
#     set, and doesn't want certain window to cause unnecessary screen redirection,
#     you can set this to `true`.
#
wintypes:
{
  tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
  dock = { shadow = false; clip-shadow-above = true; }
  dnd = { shadow = false; focus = false; full-shadow = true; }
  popup_menu = { opacity = 0.95; shadow = false; }
  dropdown_menu = { opacity = 0.95; shadow = false; }
};###########################
#     My Picom Config     #
###########################

# Shadows
shadow = true;
shadow-radius = 7;
shadow-opacity = 0.75
shadow-offset-x = -7;
shadow-offset-y = -7;
shadow-color = "#000000"
shadow-exclude = [
  "name = 'Notification'",
  "class_g = 'Conky'",
  "class_g = 'Notify-osd'",
  "class_g = 'Cairo-clock'",
  "_GTK_FRAME_EXTENTS@:c"
];
clip-shadow-above = [];
shadow-exclude-reg = ""
xinerama-shadow-crop = false;

# Fading
fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;
fade-delta = 10;
fade-exclude = [];
no-fading-openclose = false;
no-fading-destroyed-argb = false;

# Transparentness
inactive-opacity = 1.0;
frame-opacity = 0.7;
inactive-opacity-override = false;
active-opacity = 1.0;
inactive-dim = 0.0;
detect-client-opacity = true;
inactive-dim-fixed = 1.0;
opacity-rule = ["100:class_g = 'firefox'"];
# transparent-clipping = false;

# Rounded Corners
corner-radius = 0;
detect-rounded-corners = true;
rounded-corners-exclude = [
  "window_type = 'dock'",
  "window_type = 'desktop'"
];

# Bluring
blur-method = "dual_kawase";
blur-size = 8;
# blur-deviation = true;
blur-strength = 2;
blur-background = true;
# blur-background-frame = false;
# blur-background-fixed = false;
blur-kern = "3x3box";
blur-background-exclude = [
  "window_type = 'dock'",
  "window_type = 'desktop'",
  "_GTK_FRAME_EXTENTS@:c"
];

# General
# daemon = false;
# dbus = false;
# force-win-blend = false;
# no-ewmh-fullscreen = false;
# max-brightness = 1.0;
# invert-color-include = [];
# use-ewmh-active-win = false;
# unredir-if-possible = false;
# unredir-if-possible-delay = 0;
# unredir-if-possible-exclude = [];
# detect-client-leader = false;

# GLX Backend
backend = "glx";
glx-no-stencil = true;
xrender-sync-fence = true;
use-damage = true;
glx-no-rebind-pixmap = false;
vsync = true;
# resize-damage = 1;
# glx-fshader-win = "";

# Focus
mark-wmwin-focused = true;
mark-ovredir-focused = true;
focus-exclude = [ "class_g = 'Cairo-clock'"];
detect-transient = true;

# Debug
log-level = "warn";
# log-file = "/path/to/your/log/file"
# show-all-xerrors = false
# write-pid-path = "/path/to/your/log/file"

# Window type settings
#
# 'WINDOW_TYPE' is one of the 15 window types defined in EWMH standard:
#     "unknown", "desktop", "dock", "toolbar", "menu", "utility",
#     "splash", "dialog", "normal", "dropdown_menu", "popup_menu",
#     "tooltip", "notification", "combo", and "dnd".
#
# Following per window-type options are available: ::
#
#   fade, shadow:::
#     Controls window-type-specific shadow and fade settings.
#
#   opacity:::
#     Controls default opacity of the window type.
#
#   focus:::
#     Controls whether the window of this type is to be always considered focused.
#     (By default, all window types except "normal" and "dialog" has this on.)
#
#   full-shadow:::
#     Controls whether shadow is drawn under the parts of the window that you
#     normally won't be able to see. Useful when the window has parts of it
#     transparent, and you want shadows in those areas.
#
#   clip-shadow-above:::
#     Controls wether shadows that would have been drawn above the window should
#     be clipped. Useful for dock windows that should have no shadow painted on top.
#
#   redir-ignore:::
#     Controls whether this type of windows should cause screen to become
#     redirected again after been unredirected. If you have unredir-if-possible
#     set, and doesn't want certain window to cause unnecessary screen redirection,
#     you can set this to `true`.
#
wintypes:
{
  tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
  dock = { shadow = false; clip-shadow-above = true; }
  dnd = { shadow = false; focus = false; full-shadow = true; }
  popup_menu = { opacity = 0.95; shadow = false; }
  dropdown_menu = { opacity = 0.95; shadow = false; }
};
