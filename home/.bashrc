#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add Flatpak apps to PATH
if [ -d "/var/lib/flatpak/exports/bin" ]; then
    XDG_DATA_DIRS="/var/lib/flatpak/exports/bin:$XDG_DATA_DIRS"
fi

if [ -d "$HOME/.local/share/flatpak/exports/bin" ]; then
     XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/bin:$XDG_DATA_DIRS"
fi

export XDG_DATA_DIRS

. "$HOME/.aftman/env"
zsh
