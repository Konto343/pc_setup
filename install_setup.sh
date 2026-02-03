BL='\033[0;34m'
NC='\033[0m'

info() {
  echo -e "${BL}-------------$1${NC}"
}

info "Setting and updating pacman for Setup..."

sudo pacman -Syu && sudo pacman -S --needed base-devel git github-cli reflector

info "Installing Setup Apps..."

sudo pacman -S i3 xorg polybar xorg-xinit networkmanager network-manager-applet 7zip blueman btop fzf meld dunst dust cups cups-filters cups-pdf fish feh flatpak git nano ncdu fastfetch neovim npm tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer lshw tealdeer rsync powertop dysk cronie clipcat alacritty flameshot thunar lxappearance brightnessctl pavucontrol playerctl dmenu tuned-ppd lxsession blender gimp krita inkscape mpv mupdf obs-studio kdenlive qbittorrent sqlitebrowser audacity kcalc gnome-maps docker docker-compose aspell aspell-en dictd xfce4-dict keepassxc wireshark-cli gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g cowsay fortune-mod sl ttf-jetbrains-mono-nerd papirus-icon-theme gnome-themes-extra cmus cava #nvidia-open nvidia-utils nvidia-container-toolkit

info "Installing yay"

sudo rm -rf yay &&
  sudo git clone https://aur.archlinux.org/yay.git &&
  sudo chown -R 1000:1000 yay &&
  cd yay &&
  makepkg -si &&
  yay --version

info "Installing yay apps..."

yay -S -v --sudoloop vscodium-bin librewolf-bin xautolock vesktop-bin localsend-bin dict-gcide oneko

xdg-mime default thunar.desktop inode/directory
xdg-mime default Alacritty.desktop x-scheme-handler/terminal

sudo systemctl enable --now cups
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service

info "Setup complete!"
