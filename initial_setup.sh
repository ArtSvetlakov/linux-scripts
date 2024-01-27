#This script was created for single-board PC Repka pi 3.
#This script may be usefull if you often reinstall OS for some reason.
#I made this script for myself, but maybe it will be useful to someone else

#!/bin/bash
sudo apt purge firefox -y && sudo apt autoremove -y && sudo apt update && sudo apt upgrade -y && sudo apt install build-essential cmake meson autoconf -y && sudo snap install chromium && sudo snap install telegram-desktop
# cd ~/Desktop - for system with english language. Repka OS in russian by default.
cd ~/'Рабочий стол'
touch chromium.desktop
printf "[Desktop Entry]
Version=1.0
Type=Application
Name=Веб-браузер Chromium
Comment=Доступ в Интернет
Exec=/snap/bin/chromium --no-sandbox --use-gl=angle --use-angle=gl-egl
Icon=/snap/chromium/current/chromium.png
Path=
Terminal=false
StartupNotify=true" > chromium.desktop
chmod +x chromium.desktop
