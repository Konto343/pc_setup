BL='\033[0;34m'
NC='\033[0m'

info() {
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

info "Installing Window Manager"
sudo pacman --noconfirm -S i3 xorg polybar ly

info "Installing Apps"
sudo pacman --noconfirm -S networkmanager network-manager-applet 7zip blueman btop fzf powertop meld dust cmus cups cups-filters cups-pdf fish feh flatpak git kitty nano ncdu fastfetch neovim npm pyenv tmux ufw unzip zip tar tumbler ffmpeg ffmpegthumbnailer sl lshw tealdeer rsync powertop speedtest-cli dysk cronie
sudo pacman --noconfirm -S kitty flameshot thunar nwg-look nwg-bar brightnessctl pavucontrol playerctl rofi rofi-calc ttf-jetbrains-mono-nerd tuned-ppd system-config-printer print-manager kwallet lxsession
sudo pacman --noconfirm -S blender gimp krita inkscape mpv mupdf obs-studio kdenlive handbrake mupdf qbittorrent sqlitebrowser audacity
sudo pacman --noconfirm -S kcalc gnome-clocks gnome-maps gnome-disk-utility
sudo pacman --noconfirm -S docker docker-compose
sudo pacman --noconfirm -S aspell aspell-en dictd dict-gcide xfce4-dict
sudo pacman --noconfirm -S keepassxc wireshark-cli
sudo pacman --noconfirm -S gvfs gvfs-gphoto2 gvfs-mtp mtpfs ntfs-3g
yay --noconfirm -S vscodium-bin librewolf-bin xautolock
yay --noconfirm -S vesktop-bin localsend-bin

xdg-mime default thunar.desktop inode/directory
sudo systemctl enable --now cups
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now tuned.service
sudo systemctl enable --now tuned-ppd.service
sudo systemctl enable --now dictd
sudo systemctl enable ly

if [[ $(lshw -C display | grep vendor) =~ Nvidia ]]; then
  echo "Nvidia GPU found, downloading drivers..."
  yes '' | sudo pacman -S nvidia nvidia-utils nvidia-container-toolkit
fi

info "Setup complete!"
