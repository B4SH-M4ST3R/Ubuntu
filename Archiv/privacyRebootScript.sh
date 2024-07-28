#!/bin/bash

STATUS_FILE="/tmp/script_status"

function cleanup() {
    sudo apt update && sudo apt upgrade -y
    echo "Telemetrie Pakete entfernen..."
    sudo apt purge -y ubuntu-report popularity-contest apport apport-gtk whoopsie whoopsie-preferences

    echo "Diagnose Dienste deaktivieren..."
    sudo systemctl disable apport.service
    sudo systemctl disable whoopsie.service
    sudo systemctl disable whoopsie.path

    echo "Einträge zu /etc/hosts hinzufügen"
    sudo bash -c 'echo "127.0.0.1 metrics.ubuntu.com" >> /etc/hosts'
    sudo bash -c 'echo "127.0.0.1 popcon.ubuntu.com" >> /etc/hosts'

    echo "Löschen von Diagnose configs..."
    sudo rm -rf /etc/default/apport
    sudo rm -rf /etc/whoopsie
    sudo rm -rf /etc/popularity-contest.conf
    sudo rm -rf /etc/ubuntu-report

    echo "Snap deinstallieren..."
    sudo apt purge -y snapd ubuntu-core-launcher squashfs-tools
    sudo apt autoremove -y
    sudo reboot
}

function install_software() {
    echo "Software Store und Flatpak installieren..."
    sudo apt install -y --no-install-recommends gnome-software
    sudo apt install -y flatpak
    sudo apt install -y gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sudo reboot
}

# Überprüfen des Status
if [ ! -f $STATUS_FILE ]; then
    echo "cleanup" > $STATUS_FILE
    cleanup
elif grep -q "cleanup" $STATUS_FILE; then
    sed -i 's/cleanup/install_software/' $STATUS_FILE
    install_software
elif grep -q "install_software" $STATUS_FILE; then
    echo "Skript abgeschlossen!"
    rm $STATUS_FILE
fi
