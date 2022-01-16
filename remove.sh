#!/bin/bash
#This script will remove autorotate system for KDE

##################################################################
#              Developed by sergio melas 2021                    #
##################################################################

killall    Autorotate_pos.sh
killall    Autorotate_rot.sh
killall    bash

sudo rm  /etc/rc.local
sudo rm -r /usr/Autorotate
sudo rm  /etc/xdg/autostart/Autorotate_sincro_startup.desktop
sudo rm -r $HOME/.autorotate
sudo rm  /usr/bin/Autorotate_toggle.sh
sudo rm  /usr/bin/Autorotate_pos.sh
sudo rm  /usr/bin/Autorotate_rot.sh
sudo rm  /usr/bin/Autorotate_sincro_startup.sh
sudo rm  /usr/share/applications/Autorotate.desktop
sudo rm  /usr/share/icons/rstart.png
sudo rm  /usr/share/icons/rstop.png
sudo rm  /usr/share/icons/rstate.png
rm  $HOME/Desktop/Autorotate.desktop


