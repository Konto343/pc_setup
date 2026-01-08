BL='\033[0;34m'
NC='\033[0m'

info() {
  echo -e "${BL}-------------$1${NC}"
}

info "Updating pacman for init..."
sudo pacman --noconfirm -Syu
info "Installing apps required for setup..."
sudo pacman --noconfirm -S --needed base-devel git github-cli reflector

info "Installing yay"
sudo rm -r yay
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R 1000:1000 yay
cd yay
makepkg -si
yay --version

info "Installing Window Manager"
sudo pacman --noconfirm -S i3 xorg polybar startx

info "Installing Apps"
sudo pacman --noconfirm -S networkmanager network-manager-applet 7zip blueman btop fzf meld dunst dust cups cups-filters cups-pdf fish feh flatpak git nano ncdu fastfetch neovim npm tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer lshw tealdeer rsync powertop dysk cronie
sudo pacman --noconfirm -S alacritty flameshot thunar nwg-look brightnessctl pavucontrol playerctl dmenu tuned-ppd lxsession
sudo pacman --noconfirm -S blender gimp krita inkscape mpv mupdf obs-studio kdenlive qbittorrent sqlitebrowser audacity
sudo pacman --noconfirm -S kcalc gnome-maps
sudo pacman --noconfirm -S docker docker-compose
sudo pacman --noconfirm -S aspell aspell-en dictd dict-gcide xfce4-dict
sudo pacman --noconfirm -S keepassxc wireshark-cli
sudo pacman --noconfirm -S gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g
sudo pacman --noconfirm -S nvidia-open nvidia-utils nvidia-container-toolkit
# Silly packages
sudo pacman --noconfirm -S cowsay fortune-mod sl

info "Install Fonts & Icons"
sudo pacman --noconfirm -S ttf-jetbrains-mono-nerd
sudo pacman --noconfirm -S papirus-icon-theme
sudo pacman --noconfirm -S gnome-themes-extra

yay --noconfirm -S vscodium-bin librewolf-bin xautolock
yay --noconfirm -S vesktop-bin localsend-bin

xdg-mime default thunar.desktop inode/directory
sudo systemctl enable --now cups
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service
sudo systemctl enable --now dictd.service

info "Setup complete!"
