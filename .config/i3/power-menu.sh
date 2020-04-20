#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

Poweroff_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Logout_command="i3-msg exit"
Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"

# you can customise the rofi command all you want ...
rofi_command="rofi -width 10 -hide-scrollbar -bg #586e75 -opacity 95 -padding 6"

options=$'Poweroff\nReboot\nLogout\nHibernate\nSuspend'

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
