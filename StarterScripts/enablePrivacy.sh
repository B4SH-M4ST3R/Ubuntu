#!/bin/bash

echo "Telemetrie Pakete entfernen..."
sleep 1
sudo apt update && sudo apt upgrade -y
sudo apt purge ubuntu-report popularity-contest apport apport-gtk whoopsie -y


echo "Diagnose Dienste deaktivieren..."
sleep 1
sudo systemctl disable apport.service
sudo systemctl disable whoopsie.service
sudo systemctl disable whoopsie.path
# Einträge zu /etc/hosts hinzufügen
sudo bash -c 'echo "127.0.0.1 metrics.ubuntu.com" >> /etc/hosts'
sudo bash -c 'echo "127.0.0.1 popcon.ubuntu.com" >> /etc/hosts'

echo "Löschen von Diagnose configs..."
sleep 1
sudo rm -rf /etc/default/apport
sudo rm -rf /etc/whoopsie
sudo rm -rf /etc/popularity-contest.conf
sudo rm -rf /etc/ubuntu-report

echo "möchtest du Snap deinstallieren? ('j' oder 'n')"
read remSnap
if [ $remSnap == "j" ]
then	
 	echo "Snap deinstallieren..."
 	sleep 1
	sudo apt purge snapd ubuntu-core-launcher squashfs-tools
	sudo apt autoremove -y
else
	echo "Snap bleibt auf dem System"
	sleep 1
	echo "Flatpak wird neben Snap installiert"
	sleep 1
fi

echo "Software Store und Flatpak installieren..."
sleep 1
#sudo apt install --no-install-recommends gnome-software
sudo apt install flatpak
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


echo "Anpassung erfolgreich.."
sleep 1
echo "Neustart erfolgt um die Änderungen zu übernehmen.."
sleep 1

sudo reboot
