#!/bin/bash
            ##################################################################
            #               Autorotate Configuration file                    #
            #              Developed by sergio melas  2021                   #
            ##################################################################

#########################################################################################
#SCREEN: Update this according to output form command: xrandr|grep "connected primary"
# xxxx connected primary ......
#SCREEN="xxxx"
SCREEN="eDP-1"

#########################################################################################
#DIGITIZERS:Update this according to output form command: xinput list
TOUCHSCREEN="Wacom HID 5113 Finger touch"
PEN="Wacom HID 5113 Pen stylus"
ERASER="Wacom HID 5113 Pen eraser"

#########################################################################################
#KEYBOARD & TOUCHPAD: Update this according to output from command: xinput list
#keyboard   (ID1=id=# ,ID2=[slave  keyboard (#)] at the line "keyboard" for ID1 ID2
#Touch Pad  (ID3=id=# ,ID4=[slave  pointer  (#)] at the line "pointer"  for ID3 ID4
ID1=15
ID2=3
ID3=13
ID4=2

#########################################################################################
#KEYBOARD BACKLIGHT:Update this according to output form command: ls /sys/class/leds/
#add "/brightness" at the end,ie :/sys/class/leds/<KEYBOARD BACKLIGHT>/brightness
KEYBKLIGHT=/sys/class/leds/platform::kbd_backlight/brightness

#########################################################################################
#SCREEN BACKLIGHT:Update this according to output form command: ls /sys/class/backlight/
#add "/brightness" at the end,ie :/sys/class/backlight/<SCREEN BACKLIGHT>/brightness
SCRBKLIGHT=/sys/class/backlight/intel_backlight/brightness

#########################################################################################
#SOUND:Update this acordigli with, using yyyyyyyyyyyyyyyyyyyyyyyyyyy:
#pactl list sinks short
#xx   yyyyyyyyyyyyyyyyyyyyyyyyyyy     ....
SINK=alsa_output.pci-0000_00_1f.3.analog-stereo

#####################################OPTIONAL############################################
#SOUNDS: activation, desactivation, each rotation
SNDon=/usr/share/sounds/freedesktop/stereo/service-login.oga
SNDoff=/usr/share/sounds/freedesktop/stereo/service-logout.oga
SNDrotate=/usr/share/sounds/freedesktop/stereo/window-attention.oga

#####################################OPTIONAL############################################
#SOUNDS: Sound inibition file
INIBIT=$HOME/.stereo/.toggle




























#########################################################################################
#########################################################################################
#########################################################################################
#                              Do not edit below this point                             #
#########################################################################################
#########################################################################################
#########################################################################################

echo
echo $SNDon       | sudo tee -a /usr/Autorotate/SNDon.conf       > /dev/null
echo $SNDoff      | sudo tee -a /usr/Autorotate/SNDoff.conf      > /dev/null
echo $SNDrotate   | sudo tee -a /usr/Autorotate/SNDrotate.conf   > /dev/null
echo $SCREEN      | sudo tee -a /usr/Autorotate/SCREEN.conf      > /dev/null
echo $TOUCHSCREEN | sudo tee -a /usr/Autorotate/TOUCHSCREEN.conf > /dev/null
echo $PEN         | sudo tee -a /usr/Autorotate/PEN.conf         > /dev/null
echo $ERASER      | sudo tee -a /usr/Autorotate/ERASER.conf      > /dev/null
echo $KEYBKLIGHT  | sudo tee -a /usr/Autorotate/KEYBKLIGHT.conf  > /dev/null
echo $SCRBKLIGHT  | sudo tee -a /usr/Autorotate/SCRBKLIGHT.conf  > /dev/null
echo $SINK        | sudo tee -a /usr/Autorotate/SINK.conf        > /dev/null
echo $ID1         | sudo tee -a /usr/Autorotate/ID1.conf         > /dev/null
echo $ID2         | sudo tee -a /usr/Autorotate/ID2.conf         > /dev/null
echo $ID3         | sudo tee -a /usr/Autorotate/ID3.conf         > /dev/null
echo $ID4         | sudo tee -a /usr/Autorotate/ID4.conf         > /dev/null
echo $INIBIT      | sudo tee -a /usr/Autorotate/INIBIT.conf      > /dev/null
