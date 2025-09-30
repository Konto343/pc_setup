BL='\033[0;34m'
NC='\033[0m'

info () {
	echo -e "${BL}-------------$1${NC}"
}

yesno () {
	read -p "${1} [y/N] " yesno
    	case $yesno in
        	[Yy]* ) 
            		return 0;
        	;;

        	[Nn]* ) 
			return 1;
            	exit
        	;;

		* ) return 1;
	esac
}

info "Notes:"
info "I recommend you enabling 'multilib' in the pacman conf (/etc/pacman.conf), so you can get all the packages installed correctly."
info "I also recommend you update pacman with 'sudo pacman -syu', so multlib gets downloaded before hand."
info "Finally, don't forget your trusty *nano* for text editing!"

info "Installing apps required for setup"
sudo pacman -S --needed base-devel git github-cli reflector

info "Before Starting, it's Recommended to install AUR helper, such as YAY."
if yesno "Do you want to install the yay package manager?"; then
	sudo rm -r yay
	sudo git clone https://aur.archlinux.org/yay.git
	sudo chown -R 1000:1000 yay
 	cd yay
	makepkg -si
	yay --version
fi

if true; then
	info "Installing Ly (Greeter)"
	yes '' | sudo pacman -S ly
	yes '' | sudo systemctl enable ly

	info "Installing I3 Window Manager (Select all if possible.)"
	yes '' | sudo pacman -S i3 xorg polybar

	info "Installing Apps"
	# important
	yes '' | sudo pacman -S networkmanager network-manager-applet 7zip blueman btop fzf powertop meld dust cmus cups cups-filters cups-pdf fish feh flatpak git kitty nano ncdu fastfetch neovim npm pyenv tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer lshw nano-syntax-highlighting tealdeer rsync powertop speedtest-cli dysk cronie
	# other
	yes '' | sudo pacman -S kitty flameshot thunar nwg-look nwg-bar brightnessctl pavucontrol playerctl rofi ttf-jetbrains-mono-nerd tuned-ppd system-config-printer print-manager kwallet nm-applet
	yes '' | sudo pacman -S blender gimp krita hexchat inkscape libreoffice-still mpv mupdf obs-studio kdenlive handbrake mupdf qbittorrent stellarium sqlitebrowser
	yes '' | sudo pacman -S kcalc ktimer gnome-maps gnome-disk-utility
	# security related
	yes '' | sudo pacman -S keepassxc signal-desktop wireshark-cli
	# dev
	yes '' | sudo pacman -S zed
	# file systems' support
	yes '' | sudo pacman -S gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g
	# yay
	yay -S vscodium-bin librewolf-bin logseq-desktop-bin xautolock

	# syntax highlighting for nano
	echo "include /usr/share/nano-syntax-highlighting/*.nanorc" | sudo tee -a /etc/nanorc
	# set thunar as default dir browser
	xdg-mime default thunar.desktop inode/directory
	# start printer server
	sudo systemctl enable --now cups
	# network manager
	sudo systemctl enable --now NetworkManager.service 
	# turn on power manager
	sudo systemctl enable --now tuned.service
	sudo systemctl enable --now tuned-ppd.service 
	# install LazyVim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git
fi

if yesno "Do you have a Nvidia GPU?"; then
	yes '' | sudo pacman -S nvidia nvidia-utils nvidia-container-toolkit
fi

if yesno "Do you intend to use Docker?"; then
	yes '' | sudo pacman -S docker docker-compose
fi

if yesno "Do you Own a Brother Laser-Printer and want to install the driver?"; then
	yay -S brlaser
fi

if yesno "Do you want to install extra yay packages?"; then
	yay -S vesktop-bin cbonsai pipes.sh cava localsend-bin mullvad-vpn-bin gallery-dl osu-lazer-bin minecraft-launcher
fi

info "Setup complete!"
