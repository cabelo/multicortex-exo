#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE VICAM Image System
#               :
# AUTHOR        : Alessandro de Oliveira Faria <cabelo@opensuse.org>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Setting up overlay files 
#--------------------------------------
echo '** Setting up overlay files...'
/usr/bin/gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Terminal.desktop','google-chrome.desktop']"
/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'
/usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Dark
/usr/bin/gsettings set org.gnome.desktop.background picture-uri "file:////usr/share/wallpapers/studio_wallpaper.jpg"

true

#======================================
# SSL Certificates Configuration
#--------------------------------------
echo '** Rehashing SSL Certificates...'
c_rehash







#======================================
# Activate services
#--------------------------------------
suseInsertService sshd
if [[ ${kiwi_type} =~ oem|vmx ]];then
    suseInsertService grub_config
else
    suseRemoveService grub_config
fi

#======================================
# Setup default target, multi-user
#--------------------------------------
baseSetRunlevel 3

#==========================================
# remove package docs
#------------------------------------------
rm -rf /usr/share/doc/packages/*
rm -rf /usr/share/doc/manual/*
rm -rf /opt/kde*

#======================================
# only basic version of vim is
# installed; no syntax highlighting
#--------------------------------------
sed -i -e's/^syntax on/" syntax on/' /etc/vimrc

#======================================
# SuSEconfig
#--------------------------------------
suseConfig

echo "** Running ldconfig..."
/sbin/ldconfig

#======================================
# Setup default runlevel
#--------------------------------------
baseSetRunlevel 5

#======================================
# Remove yast if not in use
#--------------------------------------
suseRemoveYaST

#======================================
# Umount kernel filesystems
#--------------------------------------
baseCleanMount

exit 0
