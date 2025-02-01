echo '** Setting up overlay files...'
/usr/bin/gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Terminal.desktop','google-chrome.desktop']"
/usr/bin/gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 12'
/usr/bin/gsettings set org.gnome.desktop.interface gtk-theme Dark
/usr/bin/gsettings set org.gnome.desktop.background picture-uri "file:////usr/share/wallpapers/studio_wallpaper.jpg"

exit 0
