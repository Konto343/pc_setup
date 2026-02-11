BL='\033[0;34m'
NC='\033[0m'

info() {
  echo -e "${BL}-------------$1${NC}"
}

info "Setting and updating pacman for Setup..."

sudo pacman -Syu && sudo pacman -S --needed base-devel git github-cli reflector

info "Installing system"

sudo pacman -S i3 xorg polybar xorg-xinit kitty rofi

info "Installing apps..."

sudo pacman -S networkmanager bluez bluez-utils 7zip btop dunst cups cups-filters cups-pdf feh flatpak git nano ncdu fastfetch neovim npm ufw unzip zip tar ffmpeg ffmpegthumbnailer rsync powertop cronie clipcat flameshot thunar lxappearance brightnessctl pavucontrol playerctl tuned-ppd lxsession blender gimp krita inkscape mpv mupdf obs-studio kdenlive qbittorrent sqlitebrowser audacity kcalc gnome-maps docker docker-compose aspell aspell-en dictd xfce4-dict keepassxc wireshark-qt gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g gnome-themes-extra cmus cava #nvidia-open nvidia-utils nvidia-container-toolkit

info "Installing yay"

sudo rm -rf yay &&
  sudo git clone https://aur.archlinux.org/yay.git &&
  sudo chown -R 1000:1000 yay &&
  cd yay &&
  makepkg -si &&
  yay --version &&
  sudo rm -rf ../yay

info "Installing yay apps..."

yay -S -v --sudoloop vscodium librewolf xautolock vesktop localsend dict-gcide

xdg-mime default thunar.desktop inode/directory

sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service

info "Setup complete!"
