# My Qtile Configuration

![Screenshot of my desktop](https://github.com/AndreaSantinato/Dotfiles/blob/master/.config/screenshot/qtile_layout_03.png)

# Qtile

Qtile is a powerfull Window Manager written interaly in Python. After over a month using i3 i discovered this fantastic WM and after try it it decided to switch from i3 to Qtile on my personal machine.
Python is a powerfull language and with my programming knowledge it wasn't difficult to understand the Qtile Configuration.

# What i love about Qtile
What i love about it is the semplicity to write a new config function, read the default function and the awesome documentation. Really Simple to find, understand and incorporate into the config.py

# My Custom Changed Keybindings

The MODKEY is set to the Super key (aka the defualt Windows key on every Keyboard). I try to set the keybinding to reach them quickly.

| Keybinding | Action |
| :--- | :--- |
| `MODKEY + RETURN` | opens my terminal (gnome-terminal is the defualt terminal that i currently) |
| `MODKEY + SHIFT + RETURN` | opens the run launcher (in my case rofi is my default run launcher) |
| `MODKEY + TAB` | Toggle Through Layouts |
| `MODKEY + q` | closes the focused window |
| `MODKEY + CTRL + l` | Execute the i3lock (i use i3lock-fancy, a fork of i3lock) |
| `MODKEY + SHIFT + r` | restarts Qtile |
| `MODKEY + SHIFT + r` | quits Qtile |
| `MODKEY + SHIFT + e` | open the script power-menu.sh |
| `MODKEY + ALT + f` | open my file manager (for the moment i use vifm) |
| `MODKEY + 1-9` | switch focus of the workspace (1-10) |
| `MODKEY + SHIFT + 1-9` | send focused window to a specific workspace (1-10) |
