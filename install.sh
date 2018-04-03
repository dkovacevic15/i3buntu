#!/bin/sh

#------------------------------------------------------------------#
#                          INSTALL i3BUNTU                         #
#------------------------------------------------------------------#


###### Place the default wallpaper in $HOME directory
cp wallpaper.jpg ~/.wallpaper.jpg

###### Setup Ubuntu main and unofficial repositories as well as
###### other repositories which will simplify further installations
cp -f sources.list ~/.sources.list

###### Update to the last package lists
apt update # To get the latest package lists

###### Install main apps, drivers and dependencies
apt install -y ubuntu-drivers-common
# apt-get install -y ubuntu-restricted-extras
apt install -y ubuntu-docs
apt install -y ttf-ubuntu-font-family
apt install -y libnm-gtk-common
apt install -y openssh-client
apt install -y libstartup-notification0 upstart
apt install -y evince evince-common
apt install -y lightdm
apt install -y antoconf automake
apt install -y x11-xserver-utils
apt install -y arandr
apt install -y pavucontrol
apt install -y dconf dconf-tools
apt install -y python-gconf
apt install -y lxappearance
apt install -y policykit-desktop-privileges
apt install -y policykit-1-gnome
apt install -y vim vim-common
apt install -y thunar
apt install -y gnome-system-monitor gnome-system-tools
apt install -y network-manager
apt install -y network-manager-gnome
apt install -y network-manager-openvpn
apt install -y network-manager-openvpn-gnome
apt install -y wireless-tools
apt install -y lightdm-gtk-greeter
apt install -y lightdm-gtk-greeter-settings
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y gnome-bluetooth
apt install -y libbluetooth3 libgnome-bluetooth13
apt install -y pulseaudio-module-bluetooth
apt install -y pulseaudio-module-x11
apt install -y totem-plugins gromit
apt install -y gstreamer1.0-pulseaudio
apt install -y transmission-gtk
apt install -y pactl xbacklight
apt install -y feh
apt install -y rofi compton
apt install -y terminator
apt install -y gedit
apt install -y git
apt install -y i3 i3-wm i3blocks i3lock i3status
apt install -y xserver-xorg-video-intel
apt install -y acpi-support
apt install -y apport-gtk
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y hplip
apt install -y printer-driver-brlaser printer-driver-c2esp
apt install -y printer-driver-foo2zjs
apt install -y printer-driver-gutenprint
apt install -y printer-driver-hpcups
apt install -y printer-driver-min12xxw
apt install -y printer-driver-pnm2ppa
apt install -y printer-driver-postscript-hp
apt install -y printer-driver-ptouch printer-driver-pxljr
apt install -y printer-driver-sag-gdi printer-driver-splix
apt install -y system-config-printer-gnome
apt install -y indicator-printers
apt install -y python3-aptdaemon.pkcompat
apt install -y libssh-4 libnm-glib-vpn1
apt install -y fonts-arphic-ukai fonts-arphic-uming
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fonts-guru fonts-guru-extra fonts-kacst
apt install -y fonts-kacst-one fonts-khmeros-core
apt install -y fonts-liberation fonts-opensymbol
apt install -y fonts-nanum fonts-stix fonts-symbola
apt install -y xfonts-base xfonts-encodings
apt install -y xfonts-scalable xfonts-utils
apt install -y libxfont1 libfont-afm-perl
apt install -y libfontconfig1 libfontembed1
apt install -y libfontenc1 gnome-font-viewer
apt install -y fontconfig fontconfig-config
apt install -y dmz-cursor-theme libwayland-cursor0
apt install -y libxcursor1 xcursor-themes
apt install -y mousetweaks
apt install -y laptop-detect
apt install -y update-inetd update-notifier
apt install -y update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
apt install -y gnome-power-manager
apt install -y libgsettings-qt1
apt install -y libproxy1-plugin-gsettings
apt install -y libappindicator3-1
apt install -y gir1.2-appindicator3-0.1 gdebi
apt install -y software-properties-gtk

##### Get and install infinality (better font rendering)
add-apt-repository ppa:no1wantdthisname/ppa -y
apt-get update
apt-get upgrade -y
apt-get install -y fontconfig-infinality

###### Gdebi
apt update -y
apt install gdebi -y

##### Google chrome
wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
gdebi google*.deb

##### VS Code
wget 'https://go.microsoft.com/fwlink/?LinkID=760868'
gdebi code*.deb

##### Grub customizer
add-apt-repository ppa:danielrichter2007/grub-customizer -y
apt update -y
apt install -y grub-customizer

###### Remove old versions of the Arc theme
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}

###### Get and install the latest Arc theme
sudo add-apt-repository ppa:fossfreedom/arc-gtk-theme-daily
sudo apt-get update
sudo apt install arc-theme -y

###### Make .fonts directory if not already available
mkdir ~/.fonts

###### Get and install San Francisco Font
git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git
cp -v YosemiteSanFranciscoFont/*.ttf ~/.fonts
rm -rf YosemiteSanFranciscoFont

###### Get and install Font Awesome Web Font
git clone https://github.com/FortAwesome/Font-Awesome.git
cp -v Font-Awesome/fonts/*.ttf ~/.fonts
rm -rf Font-Awesome

###### Get and install Moka icon theme
add-apt-repository ppa:moka/daily -y
apt-get update
apt-get install -y moka-icon-theme

###### Get and install Arc icon theme
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install

#### i3gaps
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install


###### Make config directories
mkdir ~/.config
mkdir ~/.config/gtk-3.0
mkdir ~/.config/i3

###### Apply GTK theme, fonts, icon theme, login greeter
###### and i3
cp -f ./configs/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp -f ./configs/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
cp -f ./configs/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
cp -f ./configs/i3/config ~/.config/i3/config
cp -f ./configs/.compton.conf ~/.compton.conf
