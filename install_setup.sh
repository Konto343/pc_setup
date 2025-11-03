BL='\033[0;34m'
NC='\033[0m'

info () {
	echo -e "${BL}-------------$1${NC}"
}

info "Updating pacman for init..."
sudo pacman --noconfirm -Syu
info "Installing apps required for setup"
sudo pacman --noconfirm -S --needed base-devel git github-cli reflector

info "Installing yay"
sudo rm -r yay
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R 1000:1000 yay
cd yay
makepkg -si
yay --version

info "Installing I3 Window Manager (Select all if possible.)"
sudo pacman --noconfirm -S i3 xorg polybar ly

info "Installing Apps"
sudo pacman --noconfirm -S networkmanager network-manager-applet 7zip blueman btop fzf powertop meld dust cmus cups cups-filters cups-pdf fish feh flatpak git kitty nano ncdu fastfetch neovim npm pyenv tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer lshw nano-syntax-highlighting tealdeer rsync powertop speedtest-cli dysk cronie
sudo pacman --noconfirm -S kitty flameshot thunar nwg-look nwg-bar brightnessctl pavucontrol playerctl rofi ttf-jetbrains-mono-nerd tuned-ppd system-config-printer print-manager kwallet nm-applet
sudo pacman --noconfirm -S blender gimp krita hexchat inkscape libreoffice-still mpv mupdf obs-studio kdenlive handbrake mupdf qbittorrent stellarium sqlitebrowser
sudo pacman --noconfirm -S kcalc gnome-clocks gnome-maps gnome-disk-utility
sudo pacman --noconfirm -S docker docker-compose
sudo pacman --noconfirm -S keepassxc signal-desktop wireshark-cli
sudo pacman --noconfirm -S gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g
yay --noconfirm -S vscodium-bin librewolf-bin logseq-desktop-bin xautolock
yay --noconfirm -S vesktop-bin cbonsai pipes.sh cava localsend-bin mullvad-vpn-bin

echo "include /usr/share/nano-syntax-highlighting/*.nanorc" | sudo tee -a /etc/nanorc
xdg-mime default thunar.desktop inode/directory
sudo systemctl enable --now cups
sudo systemctl enable --now NetworkManager.service 
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service 
sudo systemctl enable ly

if [[ $(lshw -C display | grep vendor) =~ Nvidia ]]; then
	yes '' | sudo pacman -S nvidia nvidia-utils nvidia-container-toolkit
fi

info "Setup complete!"
