#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
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
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Mount system filesystems
#--------------------------------------
baseMount

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct

#======================================
# Add missing gpg keys to rpm
#--------------------------------------
suseImportBuildKey

sed --in-place -e 's/# solver.onlyRequires.*/solver.onlyRequires = true/' /etc/zypp/zypp.conf

#======================================
# Sysconfig Update
#--------------------------------------
echo '** Update sysconfig entries...'
baseUpdateSysConfig /etc/sysconfig/keyboard KEYTABLE us.map.gz
baseUpdateSysConfig /etc/init.d/suse_studio_firstboot NETWORKMANAGER yes
baseUpdateSysConfig /etc/sysconfig/console CONSOLE_FONT lat9w-16.psfu
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER_AUTOLOGIN tux
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER gdm
baseUpdateSysConfig /etc/sysconfig/windowmanager DEFAULT_WM gnome


#======================================
# Setting up overlay files 
#--------------------------------------
echo '** Setting up overlay files...'
mkdir -p /
#mv /studio/overlay-tmp/files/backup-pasta /usr/local/bin/backup-pasta
#chown root:users /usr/local/bin/backup-pasta
chown -R ollama.ollama  /var/lib/ollama
#chmod 755 /usr/local/bin/backup-pasta
test -d /studio || mkdir /studio
cp /image/.profile /studio/profile
cp /image/config.xml /studio/config.xml
rm -rf /studio/overlay-tmp
sh /studio/configure_gdm_theme.sh
sh /studio/configure_gnome_background.sh



true

#======================================
# Activate services
#--------------------------------------
suseInsertService sshd
suseInsertService ollama
suseInsertService multicortex-chat-ui

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
