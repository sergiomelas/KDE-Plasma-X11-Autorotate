#!/bin/bash
            ##################################################################
            #               Autorotate Configuration file                    #
            #              Developed by sergio melas  2021-23                #
            ##################################################################

#########################################################################################
#SCREEN: Update this according to output form command: xrandr|grep "connected primary"
# xxxx connected primary ......
#SCREEN="xxxx"
SCREEN="eDP"

#########################################################################################
#DIGITIZERS:Update this according to output form command: xinput list
TOUCHSCREEN="Wacom HID 524D Finger touch"
PEN="Wacom HID 524D Pen stylus"
ERASER="Wacom HID 524D Pen eraser"

#########################################################################################
#KEYBOARD & TOUCHPAD: Update this according to output from command: xinput list
#keyboard   (ID1=id=# ,ID2=[slave  keyboard (#)] at the line "keyboard" for ID1 ID2
#Touch Pad  (ID3=id=# ,ID4=[slave  pointer  (#)] at the line "pointer"  for ID3 ID4
ID1=13
ID2=3
ID3=12
ID4=2

#########################################################################################
#KEYBOARD BACKLIGHT:Update this according to output form command: ls /sys/class/leds/
#add "/brightness" at the end,ie :/sys/class/leds/<KEYBOARD BACKLIGHT>/brightness
KEYBKLIGHT=/sys/class/leds/input15::kana/brightness


#########################################################################################
#SOUND:Update this according to output form command:pactl list sinks short
#xx   yyyyyyyyyyyyyyyyyyyyyyyyyyy
#using yyyyyyyyyyyyyyyyyyyyyyyyyyy:
#Note if using pulseeffect or easyeffects use it instead of phisical output
SINK=alsa_output.pci-0000_03_00.6.HiFi__hw_Generic_1__sink
#SINK=easyeffects_sink
#####################################OPTIONAL############################################
#SOUNDS: activation, desactivation, each rotation
SNDon=/usr/share/sounds/freedesktop/stereo/service-login.oga
SNDoff=/usr/share/sounds/freedesktop/stereo/service-logout.oga
SNDrotate=/usr/share/sounds/freedesktop/stereo/window-attention.oga













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
echo $SINK        | sudo tee -a /usr/Autorotate/SINK.conf        > /dev/null
echo $ID1         | sudo tee -a /usr/Autorotate/ID1.conf         > /dev/null
echo $ID2         | sudo tee -a /usr/Autorotate/ID2.conf         > /dev/null
echo $ID3         | sudo tee -a /usr/Autorotate/ID3.conf         > /dev/null
echo $ID4         | sudo tee -a /usr/Autorotate/ID4.conf         > /dev/null

