#!/bin/sh

echo "#====================================="
echo "# Setting up GNOME desktop background "
echo "#-------------------------------------"

wallpaper="/usr/share/wallpapers/studio_wallpaper.jpg"

if [ ! -f $wallpaper ]; then
	echo "WARNING: $wallpaper not found"
	exit 0
fi

if [ -e /etc/alternatives/openSUSE-default.xml ]; then
  ln -sf /usr/share/wallpapers/studio-wallpaper.xml /etc/alternatives/openSUSE-default.xml
fi

if [ -e /etc/alternatives/SLE-default.xml ]; then
  ln -sf /usr/share/wallpapers/studio-wallpaper.xml /etc/alternatives/SLE-default.xml
fi


# works: sled 10
if [ -d "/etc/opt/gnome" ] && [ -d "/opt/gnome/" ]; then
	# sle10 has gconftool in /opt/gnome/bin, which is not in path
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /desktop/gnome/background/picture_filename $wallpaper
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /apps/gnome-session/options/splash_image $wallpaper
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /apps/gnome-session/options/splash_image $wallpaper
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /apps/gnome-session/options/splash_image $wallpaper
        /opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /apps/gnome-terminal/profiles/Default/font   "Monospace 12"
        /opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type boolean -s /apps/gnome-terminal/profiles/Default/use_system_font true
fi

# works: 11.4
if [ -d "/etc/gconf" ] && [ -d "/etc/gdm" ]; then
	gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.vendor --type string -s /desktop/gnome/background/picture_filename $wallpaper
	gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.vendor --type string -s /apps/gnome-session/options/splash_image $wallpaper
fi

/usr/bin/gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Terminal.desktop','google-chrome.desktop']"
/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'
/usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Dark

/usr/bin/gsettings set org.gnome.desktop.background picture-uri "file:////usr/share/wallpapers/studio_wallpaper.jpg"
