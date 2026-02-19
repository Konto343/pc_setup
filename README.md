# My Arch Setup:
My setup for new computers. Includes my personal dotfile and scripts as well.

## Note:
This is only for people who've installed (Arch/Gentoo) Linux and want a basic setup.
However, this repo exists to serve me personally, but you clone it if you want.

## Arch usage:
Copy the Repo, and run the "arch_install.sh" script, and finally copy over the "home" folder to your
home directory with: 
sudo cp -rf ./home/. ~/

## Gentoo usage:
If you know gentoo.
Copy over the /etc/portage configs
Adjust for packages/drivers in the WORLD file depending on system specs.
Adjust cpu-flags and video_cards in package.use for your system specs.
Compile till done.

Copy config:
sudo cp -rf ./home/. ~/
