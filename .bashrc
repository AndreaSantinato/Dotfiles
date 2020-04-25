#    ________   ________
#   |        | |
#   |________| |________        Andrea Santinato
#   |        |          |       https://github.com/AndreaSantinato
#   |        |  ________|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# All My Alias
alias ls='ls --color=auto'
alias i3conf='nvim ~/.config/i3/config'
alias polybarconf='nvim ~/.config/i3/config'
alias qtileconf='nvim ~/.config/qtile/config.py'
alias picomconf='nvim ~/.config/picom/picom.conf'
alias vim='nvim'
alias sshserver='ssh andrea@santiserver.ddns.net -p 100'

# The Cursor Style
PS1='[\u@\h \W]\$ '

# Launch Neofetch
neofetch
