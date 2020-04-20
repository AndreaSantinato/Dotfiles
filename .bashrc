# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias i3conf='nvim ~/.config/i3/config'
alias polybarconf='vnim ~/.config/i3/config'
alias picomconf='nvim ~/.config/picom/picom.conf'
alias vim='nvim'
alias sshserver='ssh andrea@santiserver.ddns.net -p 100'

PS1='[\u@\h \W]\$ '

neofetch
