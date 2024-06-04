#!/bin/bash

##################################################################
#         Autorotate_toggle.sh   toggle on/off the rotation      #
#              Developed by sergio melas 2021-23                 #
##################################################################




TOGGLE=$HOME/.autorotate/.toggle         #Toggle rotation on off

SNDon=$( cat /usr/Autorotate/SNDon.conf )
SNDoff=$( cat /usr/Autorotate/SNDoff.conf )

MUP=$HOME/.autorotate/.mup                #Toggle last rotation up
MLEFT=$HOME/.autorotate/.mleft            #Toggle last rotation left
MRIGHT=$HOME/.autorotate/.mright          #Toggle last rotation right
MDOWN=$HOME/.autorotate/.mdown            #Toggle last rotation down


if [ ! -e $TOGGLE ]; then

    #change icon and refresh desktop klicking
    cp /usr/share/icons/'rstart'.png /usr/share/icons/rstate.png
    eval $(xdotool getmouselocation --shell)
    xdotool mousemove 2 100
    xdotool click 1
    xdotool click 1
    xdotool mousemove $X $Y
    xrefresh

    notify-send -t 2000 -e 'Autorotate Enabled ' -i /usr/share/icons/rstate.png -a 'KDE Autorotate' -u low
    #Start up rotation sensor and rotator
    kstart5 bash '/usr/bin/Autorotate_rot.sh'  &
    kstart5 bash '/usr/bin/Autorotate_pos.sh'  &

    paplay $SNDon &

    touch $TOGGLE

    sleep 1
    exit 0
fi

if [ -e $TOGGLE ]; then

    #change icon and refresh desktop klicking
    if [ -e $MDOWN ];
       then
         cp /usr/share/icons/'rstop hor'.png /usr/share/icons/rstate.png
         eval $(xdotool getmouselocation --shell)
         xdotool mousemove 2 100
         xdotool click 1
         xdotool click 1
         xdotool mousemove $X $Y
         xrefresh
    fi
    if [ -e $MUP ];
       then
         cp /usr/share/icons/'rstop hor'.png /usr/share/icons/rstate.png
         eval $(xdotool getmouselocation --shell)
         xdotool mousemove 2 100
         xdotool click 1
         xdotool click 1
         xdotool mousemove $X $Y
         xrefresh
    fi
    if [ -e $MLEFT ];
       then
         cp /usr/share/icons/'rstop ver'.png /usr/share/icons/rstate.png
         eval $(xdotool getmouselocation --shell)
         xdotool mousemove 2 100
         xdotool click 1
         xdotool click 1
         xdotool mousemove $X $Y
         xrefresh
    fi
    if [ -e $MRIGHT ];
       then
         cp /usr/share/icons/'rstop ver'.png /usr/share/icons/rstate.png
         eval $(xdotool getmouselocation --shell)
         xdotool mousemove 2 100
         xdotool click 1
         xdotool click 1
         xdotool mousemove $X $Y
         xrefresh
    fi



    notify-send -t 2000 -e 'Autorotate Disabled' -i /usr/share/icons/rstate.png -a 'KDE Autorotate' -u low
    paplay $SNDoff &
    rm $TOGGLE
    kstart5 bash '/usr/bin/Autorotate_clean.sh'  &
    sleep 1
    exit 0
fi


