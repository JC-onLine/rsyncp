#!/bin/bash
echo "System:"
apt-get install -y sudo synaptic \
    numlockx \
    xbindkeys \
    linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') \
    gvfs-backends \
    pm-utils \
    vim tilix

echo "Outils:"
apt-get install -y rsync \
    screenfetch figlet \
    mc ranger tree \
    workrave jq \
    wmctrl net-tools curl nmap arp-scan \
    openssh-sftp-server \
    qdirstat \
    mugshot menulibre lightdm-gtk-greeter-settings

echo "Developement:"
apt-get install -y geany* git tig meld \
    python3-dev \
    python3-pip \
    ruby-full

echo "Graphisme:"
apt-get install -y gimp  gimp-data-extras \
    inkscape inkscape-tutorials \

