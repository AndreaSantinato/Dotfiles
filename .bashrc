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

### Archive Extraction Function
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# All My Alias
alias ls='ls --color=auto'
alias vim='nvim'
alias i3conf='nvim ~/.config/i3/config'
alias polybarconf='nvim ~/.config/polybar/config'
alias qtileconf='nvim ~/.config/qtile/config.py'
alias picomconf='nvim ~/.config/picom/picom.conf'
alias sshserver='ssh andrea@santiserver.ddns.net -p 100'

# System Updates
alias sysupdate='sudo pacman -Syyu'                      # Update the System Packages
alias yayupdate='yay -Sua --noconfirm'                   # Update the AUR Packages
alias sysyayupdate='yay -Syu --noconfirm'                # Update the System & the AUR Packages
alias syscleanup='sudo pacman -Rns $(pacman -Qtdq)'      # Remove Oprhaned Packages

# Switching from LS to Exa
alias ls='exa -al --color=always --group-directories-first' # Complete Vertical Listing
alias la='exa -a --color=always --group-directories-first'  # Listing all the Files and Directory
alias ll='exa -l --color=always --group-directories-first'  # The Long Listing Format
alias lt='exa -aT --color=always --group-directories-first' # The Tree Listing Format
alias l.='exa -a | egrep "^\."'

# Customize the GREP Output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
