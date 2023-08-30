#!/bin/bash
#This script will install autorotate system for KDE

echo  " "
echo  " ##################################################################"
echo  " #    Autorotate Script with Keyboard and Touchpad management     #"
echo  " #    Developed for X11 & KDE Plasma  by sergio melas 2021-23     #"
echo  " #                                                                #"
echo  " #                Emai: sergiomelas@gmail.com                     #"
echo  " #                   Released unde GPV V3.0                       #"
echo  " #                                                                #"
echo  " ##################################################################"
echo  " "

echo  ""

if [ $XDG_SESSION_TYPE  != 'x11' ] || [ $DESKTOP_SESSION != 'plasma' ]
then
  echo  " "
  echo  " ##################################################################"
  echo  " #  KDE Autorotate support only systems with KDE Plasma on Xorg   #"
  echo  " #                     Installation Aborted                       #"
  echo  " ##################################################################"
  echo  " "
  exit 0
fi




VAR=$0
DIR="$(dirname "${VAR}")"
cd  "${DIR}"

echo -n "Did you prepared config file  (y/N)? "
read resp


if   [ -z $resp  ]
then
   echo  ""
   echo  "Plese read the readme.txt file to see how to proceed "
   echo  ""
   exit 0
fi

if   [ $resp == 'n' ] || [ $resp == 'N' ] || [ $resp != 'y' ] && [ $resp != 'Y' ]
then
   echo  ""
   echo  "Plese read the readme.txt file to see how to proceed "
   echo  ""
   exit 0
fi

echo  "Login as administrator to install"
sudo ls >/dev/null
echo  ""

echo  "Installing Libraries:"
echo  ""
sudo apt-get install libnotify-bin
sudo apt-get install onboard
sudo apt-get install xdotool

while true
do

   echo  ""
   echo -n "Enter the theme number (1,2,3,4,5,6,7): "
   read Theme

   echo  -n "The iconset of $Theme is : "

   case $Theme in

     1)
       echo  "Blue round arrow rotation"
       sudo cp ./Payload/Theme_1/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_1/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_1/rstate.png /usr/share/icons/
       ;;
     2)
       echo  "Green Red ipad rotation"
       sudo cp ./Payload/Theme_2/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_2/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_2/rstate.png /usr/share/icons/
       ;;
     3)
       echo  "Black Phone rotation"
       sudo cp ./Payload/Theme_3/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_3/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_3/rstate.png /usr/share/icons/
       ;;
     4)
       echo  "White Phone rotation"
       sudo cp ./Payload/Theme_4/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_4/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_4/rstate.png /usr/share/icons/
       ;;
     5)
       echo  "Brown Arrows rotation"
       sudo cp ./Payload/Theme_5/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_5/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_5/rstate.png /usr/share/icons/
       ;;
     6)
       echo   "Rainbow Arrows rotation Dark"
       sudo cp ./Payload/Theme_6/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_6/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_6/rstate.png /usr/share/icons/
       ;;
     7)
       echo   "Rainbow Arrows rotation Light"
       sudo cp ./Payload/Theme_7/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_7/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_7/rstate.png /usr/share/icons/
       ;;
     *)
       echo  "Unknown Theme using default"
       sudo cp ./Payload/Theme_1/rstart.png /usr/share/icons/
       sudo cp ./Payload/Theme_1/rstop.png  /usr/share/icons/
       sudo cp ./Payload/Theme_1/rstate.png /usr/share/icons/
       ;;
   esac
   sudo chmod 777 /usr/share/icons/rstate.png
   sudo chmod 777 /usr/share/icons/rstart.png
   sudo chmod 777 /usr/share/icons/rstop.png

   notify-send -t 5000 '             Chosen Iconset' -i /usr/share/icons/rstop.png &
   echo  ""
   echo -n "Whant to change theme (y/N)? "
   read resp
   if [ -z $resp ]
   then
        break
   fi

   if [ $resp == 'n' ] || [ $resp == 'N' ] || [ $resp != 'y' ] && [ $resp != 'Y' ]
   then
        break
   fi
done

echo  "Creating system configuration files"

#Reset Position state
rm -r $HOME/.autorotate
mkdir  $HOME/.autorotate


#Prepare startup variables
sudo rm -r /usr/Autorotate
sudo mkdir /usr/Autorotate

#Install Stuff
sudo cp ./Payload/rc.local /etc/
sudo cp ./Payload/Autorotate.desktop /usr/share/applications/
sudo cp ./Payload/Autorotate_toggle.sh /usr/bin/
sudo cp ./Payload/Autorotate_pos.sh /usr/bin/
sudo cp ./Payload/Autorotate_rot.sh /usr/bin/
sudo cp ./Payload/Autorotate_clean.sh /usr/bin/
cp ./Payload/Autorotate.desktop  $HOME/Desktop

#finish config
echo  "Populating system configuration files"
bash ./Payload/Autorotate_conf.sh




