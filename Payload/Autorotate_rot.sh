#!/bin/bash

##################################################################
#          Autorotate_rot.sh   Rotate acreen                     #
#              Developed by sergio melas 2021-23                 #
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



#Read COnfiguration
SNDrotate=$( cat /usr/Autorotate/SNDrotate.conf )
SCREEN=$( cat /usr/Autorotate/SCREEN.conf )
TOUCHSCREEN=$( cat /usr/Autorotate/TOUCHSCREEN.conf )
PEN=$( cat /usr/Autorotate/PEN.conf )
ERASER=$( cat /usr/Autorotate/ERASER.conf )
KEYBKLIGHT=$( cat /usr/Autorotate/KEYBKLIGHT.conf )
SINK=$( cat /usr/Autorotate/SINK.conf )
ID1=$( cat /usr/Autorotate/ID1.conf )
ID2=$( cat /usr/Autorotate/ID2.conf )
ID3=$( cat /usr/Autorotate/ID3.conf )
ID4=$( cat /usr/Autorotate/ID4.conf )


#Memorise Keybord britgtness
kbbrit=$(cat  $KEYBKLIGHT)





echo run

#Scan for orientation changes and if cative execute them
while [ -e $TOGGLE ]
do

   if [ -e $TOGGLE ] #If autorotate is active
   then

      if [ -e $MROT ] #If rotation not done
      then
         sleep 0.1   #Timer to be shure rotation is not a wiggle
         if [ -e $MROT ] #If rotation confirmed
         then
            echo NEED ROTATE
            #Memorise Keybord britgtness and switch off
            kbbrit=$(cat  $KEYBKLIGHT)


            if [ -e $CLEFT ] #If rotation left
            then
               echo ROTATE LEFT
               #play sound
               paplay $SNDrotate &


               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               killall plank
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
               echo ROTATE RIGHT
               #play sound
               paplay $SNDrotate &

               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               killall plank
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
               echo ROTATE DOWN
               #play sound
               paplay $SNDrotate &


               if [[ $kbbrit -gt 0 ]]
               then
                  echo 0 > $KEYBKLIGHT
               fi

               #Kill Dock
               killall latte-dock
               killall plank
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

               #Start On screen Keyboard
               onboard &

               #Add reverse stereo to sound profiles
               pactl load-module module-remap-sink sink_name=Reverse master=$SINK \
               channels=2 master_channel_map=front-left,front-right channel_map=front-right,front-left \
               sink_properties="device.description='Reverse-Stereo'"

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
               echo ROTATE UP
               #play sound
               paplay $SNDrotate &


               #Kill Dock
               killall latte-dock
               killall plank
               #Kill on screen keyboard
               killall onboard

               #Rotate Screen and Touch and pen to Normal
               xrandr --output $SCREEN --rotate normal &
               xinput set-prop "$TOUCHSCREEN"    "$TRANSFORM" 1 0 0 0 1 0 0 0 1
               xinput set-prop "$PEN"            "$TRANSFORM" 1 0 0 0 1 0 0 0 1
               xinput set-prop "$ERASER"         "$TRANSFORM" 1 0 0 0 1 0 0 0 1




               #Start dock
               latte-dock --replace &
               plank &

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

            echo RORATION COMPLETE
            rm $MROT
            sleep 2
            #Restore keyboard  backlight
            echo $kbbrit > $KEYBKLIGHT


        fi
     fi

     #if rotating down force sound output
     if [ -e $MDOWN ];
     then
           #Put sound to Resverse
           pactl set-default-sink Reverse
           #Alwais force reverse volume
           pactl set-sink-volume Reverse 100%
           sleep 0.05
     else
        sleep 0.1
     fi
   else
     sleep 0.1
   fi

done



