#!/bin/bash

##################################################################
#          Autorotate_rot.sh   Rotate acreen                     #
#              Developed by sergio melas 2021                    #
##################################################################


#Initialize Global Variables
TRANSFORM='Coordinate Transformation Matrix'
TOGGLE=$HOME/.autorotate/.toggle         #Toggle rotation on off

MROT=$HOME/.autorotate/.mrot             #Toggle rotation not done

CUP=$HOME/.autorotate/.cup                #Toggle rotation up
CLEFT=$HOME/.autorotate/.cleft            #Toggle rotation left
CRIGHT=$HOME/.autorotate/.cright          #Toggle rotation right
CDOWN=$HOME/.autorotate/.cdown            #Toggle rotation down

MUP=$HOME/.autorotate/.mup                #Toggle last rotation up
MLEFT=$HOME/.autorotate/.mleft            #Toggle last rotation left
MRIGHT=$HOME/.autorotate/.mright          #Toggle last rotation right
MDOWN=$HOME/.autorotate/.mdown            #Toggle last rotation down


SNDrotate=$( cat /usr/Autorotate/SNDrotate.conf )
SCREEN=$( cat /usr/Autorotate/SCREEN.conf )
TOUCHSCREEN=$( cat /usr/Autorotate/TOUCHSCREEN.conf )
PEN=$( cat /usr/Autorotate/PEN.conf )
ERASER=$( cat /usr/Autorotate/ERASER.conf )
KEYBKLIGHT=$( cat /usr/Autorotate/KEYBKLIGHT.conf )
SCRBKLIGHT=$( cat /usr/Autorotate/SCRBKLIGHT.conf )
SINK=$( cat /usr/Autorotate/SINK.conf )
ID1=$( cat /usr/Autorotate/ID1.conf )
ID2=$( cat /usr/Autorotate/ID2.conf )
ID3=$( cat /usr/Autorotate/ID3.conf )
ID4=$( cat /usr/Autorotate/ID4.conf )

rm $MUP
rm $MLEFT
rm $MRIGHT
rm $MDOWN


#Memorise Screen and Keybord britgtness
kbbrit=$(cat  $KEYBKLIGHT)
scbrit=$(cat  $SCRBKLIGHT)


echo run

#Scan for orientation changes and if cative execute them
while :
do

   if [ -e $TOGGLE ] #If autorotate is active
   then

      if [ -e $MROT ] #If rotation not done
      then
         sleep 1    #Timer to be shure rotation is not a wiggle
         if [ -e $MROT ] #If rotation confirmed
         then

            if [ -e $CLEFT ] #If rotation left
            then
               #play sound
               paplay $SNDrotate &

               #Memorise Screen and Keybord britgtness and switch off
               scbrit=$(cat  $SCRBKLIGHT)
               kbbrit=$(cat  $KEYBKLIGHT)
               echo 0 > $SCRBKLIGHT
               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               #Kill on screen keyboard
               killall onboard

               #Kill keyboard and Touchpad
               xinput float $ID1 &
               xinput float $ID3 &

               #rotate screen pen and touchscreen
               xrandr --output $SCREEN  --rotate left &
               xinput set-prop "$TOUCHSCREEN"    "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
               xinput set-prop "$PEN"            "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
               xinput set-prop "$ERASER"         "$TRANSFORM" 0 -1 1 1 0 0 0 0 1


               #Start On screen Keyboard
               onboard &

               #Remove reverse stereo from sound profiles
                pactl set-default-sink $SINK
                pactl unload-module module-remap-sink


               #Memorise Left state
               rm $MUP
               touch $MLEFT
               rm $MRIGHT
               rm $MDOWN



            fi

            if [ -e $CRIGHT ] #If rotation right
            then
               #play sound
               paplay $SNDrotate &

               #Memorise Screen and Keybord britgtness and switch off
               scbrit=$(cat  $SCRBKLIGHT)
               kbbrit=$(cat  $KEYBKLIGHT)
               echo 0 > $SCRBKLIGHT
               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               #Kill on screen keyboard
               killall onboard

               #Kill Keyboard and Touchpad
               xinput float $ID1 &
               xinput float $ID3 &

               #rotate screen pen and touchscreen
               xrandr --output $SCREEN --rotate right &
               xinput set-prop "$TOUCHSCREEN"    "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
               xinput set-prop "$PEN"            "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
               xinput set-prop "$ERASER"         "$TRANSFORM" 0 1 0 -1 0 1 0 0 1

               #Start On screen Keyboard
               onboard &

               #Remove reverse stereo from sound profiles
               pactl set-default-sink $SINK
               pactl unload-module module-remap-sink

               #Memorise Right state
               rm $MUP
               rm $MLEFT
               touch $MRIGHT
               rm $MDOWN
            fi

            if [ -e $CDOWN ] #If rotation Botto up
            then
               #play sound
               paplay $SNDrotate &

               #Memorise Screen and Keybord britgtness and switch off
               scbrit=$(cat  $SCRBKLIGHT)
               kbbrit=$(cat  $KEYBKLIGHT)
               echo 0 > $SCRBKLIGHT
               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               #Kill on screen keyboard
               killall onboard

               #Kill Keyboard and Touchpad
               xinput float $ID1 &
               xinput float $ID3 &

               #rotate screen pen and touchscreen
               xrandr --output $SCREEN --rotate inverted &
               xinput set-prop "$TOUCHSCREEN"    "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
               xinput set-prop "$PEN"            "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
               xinput set-prop "$ERASER"         "$TRANSFORM" -1 0 1 0 -1 1 0 0 1

               #Add reverse stereo to sound profiles
               pactl load-module module-remap-sink sink_name=Reverse master=$SINK channels=2 master_channel_map=front-left,front-right channel_map=front-right,front-left
               pactl set-default-sink Reverse
               pactl set-sink-volume Reverse 100%


               #Memorise Down state
               rm $MUP
               rm $MLEFT
               rm $MRIGHT
               touch $MDOWN

            fi

            if [ -e $CUP ] #If rotation Normal
            then
               #play sound
               paplay $SNDrotate &

               #Screen switch off
               echo 0 > $SCRBKLIGHT

               #Kill Dock
               killall latte-dock
               #Kill on screen keyboard
               killall onboard

               #Rotate Screen and Touch and pen to Normal
               xrandr --output $SCREEN --rotate normal &
               xinput set-prop "$TOUCHSCREEN"    "$TRANSFORM" 1 0 0 0 1 0 0 0 1
               xinput set-prop "$PEN"            "$TRANSFORM" 1 0 0 0 1 0 0 0 1
               xinput set-prop "$ERASER"         "$TRANSFORM" 1 0 0 0 1 0 0 0 1




               #Start dock
               latte-dock --replace &


               #Start Keyboard and Touchpad
               xinput reattach $ID1 $ID2 &
               xinput reattach $ID3 $ID4 &

               #Restore keyboard backlight
               if [[ $kbbrit -gt 0 ]]
               then
                  echo $kbbrit > $KEYBKLIGHT
               fi


               #Remove reverse stereo from sound profiles
               pactl set-default-sink $SINK
               pactl unload-module module-remap-sink

               #Memorise Normal state
               touch $MUP
               rm $MLEFT
               rm $MRIGHT
               rm $MDOWN

            fi

            rm $MROT
            sleep 2
            #Restore screen  backlight
            echo $scbrit > $SCRBKLIGHT

        fi
     fi

     #if rotating down force sound output
     if [ -e $MDOWN ];
     then
        #Put sound to normal
        pactl set-default-sink Reverse
        #Alwais force reverse volume
        pactl set-sink-volume Reverse 100%
        sleep 0.05
     else
        sleep 0.01
     fi
   else
     sleep 0.25
   fi


   #Activate left click
   xsetwacom --set   "$TOUCHSCREEN"    Gesture off

done
