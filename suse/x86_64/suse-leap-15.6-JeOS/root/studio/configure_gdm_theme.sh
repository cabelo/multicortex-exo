#!/bin/sh

echo "#====================================="
echo "# Setting up GDM theme                "
echo "#-------------------------------------"

wallpaper="/usr/share/wallpapers/studio_wallpaper.jpg"

#/opt/gnome/bin/gconftool-2 --type bool --set /desktop/gnome/interface/accessibility true
/usr/bin/gconftool-2 -s -t bool /desktop/gnome/remote_access/enabled true

if [ ! -f $wallpaper ]; then
	echo "WARNING: $wallpaper not found"
	exit 0
fi

# works: sled 10
if [ -d "/etc/opt/gnome" ] && [ -d "/opt/gnome/" ]; then
	# sle10 has gconftool in /opt/gnome/bin, which is not in path
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /desktop/gnome/background/picture_filename $wallpaper
	/opt/gnome/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.defaults --type string -s /apps/gnome-session/options/splash_image $wallpaper

	# sles10 themes are stored in /opt/gnome, so we make a symlink there from dir
	# that we use in newer versions
	ln -s /usr/share/gdm/themes/studio /opt/gnome/share/gdm/themes/studio

	# enable gdm theme
	sed -i 's#GraphicalTheme=.*#GraphicalTheme=studio#g' /etc/opt/gnome/gdm/gdm.conf
fi


# works: 11.4
if [ -d "/etc/gconf" ] && [ -d "/etc/gdm" ]; then
	# background, this works nicely for all distros
	gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.vendor --type string -s /desktop/gnome/background/picture_filename $wallpaper
	gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.vendor --type string -s /apps/gnome-session/options/splash_image $wallpaper

	# enable gdm theme
	[ -f /usr/share/gdm/defaults.conf ] && sed -i 's#GraphicalTheme=.*#GraphicalTheme=studio#g' /usr/share/gdm/defaults.conf
	[ -f /etc/gdm/custom.conf ] && sed -i 's#\[greeter\]#[greeter]\nGraphicalTheme=studio\nGraphicalThemeDir=/usr/share/gdm/themes/\n#g' /etc/gdm/custom.conf
fi
