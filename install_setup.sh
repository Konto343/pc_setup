BL='\033[0;34m'
NC='\033[0m'

info() {
  echo -e "${BL}-------------$1${NC}"
}

info "Setting and updating pacman for Setup..."
sudo pacman -Syu && sudo pacman -S --needed base-devel git github-cli reflector

info "Installing base enviroment..."
sudo pacman -S sway swaybg swaylock swayidle waybar grim slurp foot fuzzel

info "Installing system apps..."
sudo pacman -S networkmanager bluetui bluez bluez-libs bluez-utils 7zip btop fzf meld dust dunst cups cups-filters cups-pdf feh flatpak git nano ncdu 
fastfetch neovim npm tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer lshw tealdeer rsync powertop dysk cronie thunar lxappearance brightnessctl pavucontrol playerctl tuned-ppd lxsession blender gimp krita inkscape mpv mupdf obs-studio kdenlive qbittorrent sqlitebrowser audacity kcalc gnome-maps docker docker-compose aspell aspell-en dictd xfce4-dict keepassxc wireshark-qt gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g cowsay fortune-mod sl cmus cava #nvidia-open nvidia-utils nvidia-container-toolkit

info "Installing yay"
sudo rm -rf yay &&
  sudo git clone https://aur.archlinux.org/yay.git &&
  sudo chown -R 1000:1000 yay &&
  cd yay &&
  makepkg -si &&
  yay --version &&
  sudo rm -rf ../yay

info "Installing yay apps..."
yay -S -v --sudoloop vscodium-bin librewolf-bin xautolock vesktop-bin localsend-bin dict-gcide

xdg-mime default thunar.desktop inode/directory

sudo systemctl enable --now cups
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service

info "Setup complete!"
