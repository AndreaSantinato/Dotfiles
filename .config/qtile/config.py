# -*- coding: utf-8 -*-
#    ________   ________
#   |        | |
#   |________| |________        Andrea Santinato
#   |        |          |       https://github.com/AndreaSantinato
#   |        |  ________|
#
# A customized config.py for Qtile window manager (http://www.qtile.org)
# Modified by Andrea Santinato (https://github.com/AndreaSantinato)
#
# The following comments are the copyright and licensing information from the default
# qtile config. Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma,
# 2012-2014 Tycho Andersen, 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.

##########################################
##### IMPORTS ALL NECESSARY LIBRARIES#####
##########################################

import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401from typing import List  # noqa: F401

###########################################
##### DEFINING SOME GENERAL VARIABLES #####
###########################################

mod = "mod4"                                           # Sets mod key to SUPER/WINDOWS
altMod = "mod1"                                        # Sets altMod key to ALT
myTerm = "alacritty"                                   # My terminal of choice
myFileManager = "nautilus"                             # My File Manager Of Choice
myEditor = "neovide"                                   # My Terminal/Graphical Editor Of Choise
myConfig = "/home/andrea/.config/qtile/config.py"      # My Customm Qtile Config File Location
myBrowser = "qutebrowser"                              # My terminal of choice

###########################
##### ALL KEYBINDINGS #####
###########################

keys = [
         ### The essentials
         Key(
             [mod], "Return",
             lazy.spawn(myTerm),
             desc='Launches Terminal'
             ),
         Key(
             [mod, "shift"], "Return",
             #lazy.spawn("rofi -show drun -show-icons"),
             lazy.spawn(".config/rofi/launchers/misc/launcher.sh"),
             desc='Rofi Run Launcher'
             ),
         Key(
             [mod], "Tab",
             lazy.next_layout(),
             desc='Toggle Through Layouts'
             ),
         Key(
             [mod], "q",
             lazy.window.kill(),
             desc='Kill The Active Window'
             ),
         Key(
             [mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key(
             [mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         Key(
             [mod, "shift"], "e",
             lazy.spawn(".config/qtile/power-menu.sh"),
             desc='Launches The Power-Menu Script'
             ),
         Key(
             [mod], "f",
             lazy.spawn(myFileManager),
             desc='Launches A Graphical File Manager'
             ),
         Key(
             [mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='Toggle Floating'
             ),
         ### My Applications Launched With SUPER + ALT + KEY
         Key(
             [mod, altMod], "e",
             lazy.spawn(myEditor),
             desc='Launches My Terminal/Graphical Editor Of Choise'
             ),
         Key(
             [mod, altMod], "f",
             lazy.spawn(myTerm+" -e vifm"),
             desc='Launches VIFM'
             ),
         Key(
             [mod, altMod], "s",
             lazy.spawn("stacer"),
             desc='Launches The Stacer Utility'
             ),
         Key(
             [mod, altMod], "v",
             lazy.spawn("pavucontrol"),
             desc='Launches The Pavu-Volume-Control Utility'
             ),
         Key(
             [mod, altMod], "n",
             lazy.spawn("nitrogen"),
             desc='Launches The Nitrogen Wallpaper Utility'
             ),
         ### My Program Launched With SUPER + CTRL + KEY ###
         Key(
             [mod, "control"], "l",
             lazy.spawn("i3lock-fancy -pf Comic-Sans-MS"),
             desc='Launches The i3lock-fancy Process'
            ),
         ### Window controls
         Key(
             [mod], "k",
             lazy.layout.down(),
             desc='Move The Focus Down In The Current Stack Pane'
             ),
         Key(
             [mod], "j",
             lazy.layout.up(),
             desc='Move The Focus Up In The Current Stack Pane'
             ),
         Key(
             [mod, "shift"], "k",
             lazy.layout.shuffle_down(),
             desc='Move The Windows Down In The Current Stack'
             ),
         Key(
             [mod, "shift"], "j",
             lazy.layout.shuffle_up(),
             desc='Move The Windows Up In The Current Stack'
             ),
         Key(
             [mod], "h",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand The Window (MonadTall), Increase Number In Master Pane (Tile)'
             ),
         Key(
             [mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink The Window (MonadTall), Decrease Number In Master Pane (Tile)'
             ),
         Key(
             [mod], "n",
             lazy.layout.normalize(),
             desc='Normalize The Window Size Ratios'
             ),
         Key(
             [mod], "m",
             lazy.layout.maximize(),
             desc='Toggle The Window Between Minimum And Maximum Sizes'
             ),
         ### Stack controls
         Key(
             [mod, "shift"], "space",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch Which Side Main Pane Occupies (XmonadTall)'
             ),
         Key(
             [mod], "space",
             lazy.layout.next(),
             desc='Switch The Window Focus To Other Pane(s) Of The Stack'
             ),
         Key(
             [mod, "control"], "Return",
             lazy.layout.toggle_split(),
             desc='Toggle Between Split And Unsplit Aides Of The Stack'
             ),
         ]

##############################
##### WORKSPACE'S GROUPS #####
##############################

groups = [Group("Web", {'layout': 'monadtall'}),
              Group("Dev", {'layout': 'monadtall'}),
              Group("Terminal", {'layout': 'monadtall'}),
              Group("Folder", {'layout': 'monadtall'}),
              Group("Media", {'layout': 'monadtall'}),
              Group("System", {'layout': 'monadtall'})]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group
from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

layout_theme = {"border_width": 3,
                "margin": 14,
                "border_focus": "1565C0",
                "border_normal": "2979FF"
                }

layouts = [
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.TreeTab(
         font = "Ubuntu",
         fontsize = 10,
         sections = ["FIRST", "SECOND", "THIRD", "FOURTH"],
         section_fontsize = 10,
         border_width = 2,
         bg_color = "1c1f24",
         active_bg = "c678dd",
         active_fg = "000000",
         inactive_bg = "a9a1e1",
         inactive_fg = "1c1f24",
         padding_left = 0,
         padding_x = 0,
         padding_y = 5,
         section_top = 10,
         section_bottom = 20,
         level_shift = 8,
         vspace = 3,
         panel_width = 200
         ),
    layout.Floating(**layout_theme)
]

########################
##### COLORS THEME #####
########################

colors = [["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens

dracula = [["#272935", "#272935"], # [0 -> Black (Panel Background)]
          ["#434758", "#434758"],  # [1 -> Gray (Background For Current Screen Group Tab)]
          ["#6071a4", "#6071a4"],  # [2 -> Indigo]
          ["#668bd7", "#668bd7"],  # [3 -> Indigo Dark]
          ["#2979FF", "#2979FF"],  # [4 -> Blue]
          ["#1565C0", "#1565C0"],  # [5 -> Dark Blue]
          ["#8be8fd", "#8be8fd"],  # [6 -> Cyan]
          ["#52fa7c", "#52fa7c"],  # [7 -> Lime Green]
          ["#ffb86b", "#ffb86c"],  # [8 -> Orange]
          ["#ff7ac6", "#ff7ac6"],  # [9 -> Pink]
          ["#e1acff", "#e1acff"],  # [10 -> Purple Light]
          ["#bf95f9", "#bf95f9"],  # [11 -> Purple]
          ["#8d62a9", "#8d62a9"],  # [12 -> Purple Dark]
          ["#ff5757", "#ff5757"],  # [13 -> Red (Border Line Color For Current Group Tab)]
          ["#f1fa89", "#f1fa89"],  # [14 -> Yellow]
          ["#ffffff", "#ffffff"],  # [15 -> White (Font Color For Group/Module Names)]
          ["#000000", "#000000"]]  # [16 -> Dark Black]

##################
##### PROMPT #####
##################

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

########################
#### Mouse CallBacks ###
########################

def open_rofidmenu(qtile):
    qtile.cmd_spawn('rofi -show drun -show-icons')

def open_powerscriptmenu(qtile):
    qtile.cmd_spawn('.config/qtile/power-menu.sh')

###################################
##### DEFAULT WIDGET SETTINGS #####
###################################

widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize = 12,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[0],
            background = dracula[12]
            ),
        widget.GroupBox(font="Ubuntu Bold",
            fontsize = 10,
            margin_y = 4,
            margin_x = 0,
            padding_y = 6,
            padding_x = 6,
            borderwidth = 4,
            active = dracula[15],
            inactive = dracula[0],
            rounded = True,
            highlight_color = dracula[3],
            highlight_method = "line",
            this_current_screen_border = dracula[3],
            this_screen_border = dracula[3],
            other_current_screen_border = dracula[3],
            other_screen_border = dracula[0],
            foreground = dracula[15],
            background = dracula[12]
            ),
        widget.Prompt(
            prompt = prompt,
            font = "Ubuntu Mono",
            padding = 10,
            foreground = colors[3],
            background = colors[1]
            ),
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[0],
            background = dracula[0]
            ),
        widget.WindowName(
            foreground = dracula[15],
            background = dracula[0],
            padding = 0
            ),
        widget.Sep(
            linewidth = 0,
            padding = 6,
            foreground = colors[0],
            background = dracula[0]
            ),
        widget.Systray(
            background = colors[0],
            padding = 5
            ),
        widget.CheckUpdates(
            update_interval = 1800,
            distro = "Arch_checkupdates",
            display_format = " ⟳ {updates} Aggiornamenti",
            foreground = colors[2],
            background = dracula[12],
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')}
            ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            background = dracula[3],
            foreground = dracula[15],
            padding = 0,
            scale=0.7
            ),
        widget.CurrentLayout(
            background = dracula[3],
            foreground = dracula[15],
            padding = 5
            ),
        widget.TextBox(
            text=" 🌡",
            padding = 2,
            background = dracula[12],
            foreground = dracula[15],
            fontsize=11
            ),
        widget.ThermalSensor(
            background = dracula[12],
            foreground = dracula[15],
            padding = 5
            ),
        widget.TextBox(
            text=" 🖬",
            background = dracula[3],
            foreground = dracula[15],
            padding = 0,
            fontsize=14
            ),
        widget.Memory(
            background = dracula[3],
            foreground = dracula[15],
            padding = 5
            ),
        widget.Volume(
            background = dracula[12],
            foreground = dracula[15],
            padding = 5
            ),
        widget.Clock(
            background = dracula[3],
            foreground = dracula[15],
            format="%A, %B %d  [ %H:%M ]",
            padding=6
            ),
        widget.Sep(
            linewidth = 0,
            background = dracula[12],
            foreground = colors[0],
            padding = 8
            ),
        widget.TextBox(
            text='⏻',
            background = dracula[12],
            foreground = dracula[15],
            padding=0,
            fontsize=18,
            ),
        widget.Sep(
            linewidth = 0,
            background = dracula[12],
            foreground = colors[0],
            padding = 8
            ),
        widget.QuickExit(
            background = dracula[12],
            foreground = dracula[15],
            ),
        ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    del widgets_screen1[7:8]               # Slicing removes unwanted widgets (systray) on Monitors 1,3
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),      # tastyworks exit box
    Match(title='Qalculate!'),        # qalculate-gtk
    Match(wm_class='kdenlive'),       # kdenlive
    Match(wm_class='pinentry-gtk-2'), # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
