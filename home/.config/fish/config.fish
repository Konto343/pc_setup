function fish_prompt
	string join '' -- \n (set_color yellow) (date +'%H:%M:%S %p') ' ' (set_color $fish_color_cwd) (whoami) (set_color normal) '@' (set_color cyan) (prompt_hostname) ' ' (set_color cyan) (prompt_pwd) (set_color normal) ' > '
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove annoying welcome message
set fish_greeting

# Alias
alias ls='ls -la'
alias reload_waybar="pkill waybar && hyprctl dispatch exec waybar"
alias refresh_mirrors="sudo reflector --latest 50 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose"
alias update_reboot="sudo pacman -Syu && yay -Syu && sudo systemctl stop docker && flatpak update && reboot"

function weather
    curl "https://wttr.in/$argv[1]"
end
