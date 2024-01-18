#The purpose of this script is to resize /swapfile.
#The script was created primarily for single-board Repka pi 3, but is suitable for Ubuntu if you initially have /swapfile on the system.
#If your swapfile is located in a different path (not in /), you will have to modify this script.

#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No parameters found! Please run script with exact size of swap and with root privileges! (example: sudo ./edit_swap.sh 4G)"
  echo "If you didn't have any swap files before you need to edit \"/etc/fstab\" file by adding the entry \"/swapfile swap  swap defaults 0 0\" and reboot your system!"
  exit
fi

if [ "$(id -u)" -ne 0 ]; then 
  echo "Please run as root!"
  exit 
else
  sudo swapoff /swapfile
  sudo rm /swapfile 
  sudo fallocate -l $1 /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  echo "\"/swapfile\" with "$1" size was created!"
  sudo swapon --show
fi
