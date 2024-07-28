#!/bin/bash

echo "Standard Software installieren und updaten..."
sleep 1
sudo apt update && sudo apt upgrade -y

echo "Spotify"
sleep 1
flatpak install flathub com.spotify.Client -y

echo "VLC Player"
sleep 1
flatpak install flathub org.videolan.VLC -y

echo "Thunderbird"
sleep 1
flatpak install flathub org.mozilla.Thunderbird -y

echo "Gnome Extension Manager"
sleep 1
flatpak install flathub com.mattjakeman.ExtensionManager -y

echo "Discord"
sleep 1
flatpak install flathub com.discordapp.Discord -y

echo "Audacity"
sleep 1
flatpak install flathub org.audacityteam.Audacity -y

echo "Brave"
sleep 1
flatpak install flathub com.brave.Browser -y

echo "OBS Studio"
sleep 1
flatpak install flathub com.obsproject.Studio -y

echo "Gimp"
sleep 1
flatpak install flathub org.gimp.GIMP -y

echo "GHex"
sleep 1
flatpak install flathub org.gnome.GHex -y

echo "Steam"
sleep 1
flatpak install flathub com.valvesoftware.Steam -y

echo "KdenLive"
sleep 1
flatpak install flathub org.kde.kdenlive -y

echo "KeePassXC"
sleep 1
flatpak install flathub org.keepassxc.KeePassXC -y

echo "Remmina"
sleep 1
flatpak install flathub org.remmina.Remmina -y

echo "VSCodium"
sleep 1
flatpak install flathub com.vscodium.codium -y

echo "FileZilla FTP"
sleep 1
flatpak install flathub org.filezillaproject.Filezilla -y

echo "FlameShot"
sleep 1
flatpak install flathub org.flameshot.Flameshot -y

echo "FreeTube"
sleep 1
flatpak install flathub io.freetubeapp.FreeTube -y

echo "VM Boxes"
sleep 1
flatpak install flathub org.gnome.Boxes -y

echo "Android Studio"
sleep 1
flatpak install flathub com.google.AndroidStudio -y

echo "Arduino IDE"
sleep 1
flatpak install flathub cc.arduino.IDE2 -y

echo "DB Browser SQLite"
sleep 1
flatpak install flathub org.sqlitebrowser.sqlitebrowser -y

echo "Tor Browser"
sleep 1
sudo apt-get install torbrowser-launcher -y

echo "OnionShare"
sleep 1
flatpak install flathub org.onionshare.OnionShare -y

echo "Autopsy"
sleep 1
sudo snap install autopsy

echo "Flatseal"
sleep 1
flatpak install flathub com.github.tchx84.Flatseal -y
