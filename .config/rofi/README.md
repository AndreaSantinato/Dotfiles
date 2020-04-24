# My Rofi Configuration

![Screenshot of Rofi](https://github.com/AndreaSantinato/Dotfiles/blob/master/.config/rofi/screenshot/rofi_layout_01.png)

# What is Rofi?

When i decided to switch from a Desktop Environment to a Tiling Window Manager i hadn't realized how many software were available to me, one of theme was Rofi.
Rofi is a Run Launcher that allow you to graphically find i program and launch it with a few keyboard's click. I love it because unlike dmenu it has a much more functionality and have a more user friendly interface where to find a program.

# Install Rofi

You can install rofi using the arch repository package or the AUR package.
if you want the basic and normal rofi launcher you can install it from the official Arch Repository using pacman:

`sudo pacman -S rofi`

if you want the AUR version (Arch User Repository) of rofi launcher you can install the rofi-dmenu version that have a more feature:

`yay -S rofi-dmenu`

# Customize Rofi

Rofi has a lot of customization feature, one of theme is the ability to install a lot of theme that gave the .raise extension.
All theme are stored into "/usr/share/rofi/themes" folder on your computer.

![Screenshot of Rofi](https://github.com/AndreaSantinato/Dotfiles/blob/master/.config/rofi/screenshot/rofi_layout_02.png)

Rofi come with a lot of default theme, but you can download (or create) a custom theme to move into the "/usr/share/rofi/themes" folder.
To choose a theme just enter "rofi-theme-selector" in the terminal and press enter. Will appair Rofi but now it let you choose a theme, use the arrow key to navigate into the list, use enter to have a demo of that theme and use alt+a to confirm the choosen theme
