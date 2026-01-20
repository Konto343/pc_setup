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
alias refresh_mirrors="sudo reflector --latest 50 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose"
alias update_reboot="sudo pacman -Syu && yay -Syu && flatpak update -y && reboot"
alias purge_cache="sudo pacman -Scc && yay -Scc"

function timer -d "Set a timer" -a seconds minutes hours
	echo "Timer set"
	set time (math "$seconds + ($minutes x 60) + ($hours x 3600)")
	sleep $time
	notify-send "Timer" "Timer has finished"
end

function weather -d "Print the weather" -a city_name
    curl "https://wttr.in/$city_name"
end
