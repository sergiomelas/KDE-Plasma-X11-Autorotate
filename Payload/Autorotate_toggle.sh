#!/bin/bash

##################################################################
#         Autorotate_toggle.sh   toggle on/off the rotation      #
#              Developed by sergio melas 2021                    #
##################################################################




TOGGLE=$HOME/.autorotate/.toggle         #Toggle rotation on off

SNDon=$( cat /usr/Autorotate/SNDon.conf )
SNDoff=$( cat /usr/Autorotate/SNDoff.conf )


if  [ $1 = "-stop" ]; then
    echo stopping
    rm $TOGGLE

    #change icon and refresh desktop klicking
    cp /usr/share/icons/rstop.png /usr/share/icons/rstate.png
    exit 0
fi


if [ ! -e $TOGGLE ]; then

    paplay $SNDon &

    touch $TOGGLE

    #change icon and refresh desktop klicking
    cp /usr/share/icons/rstart.png /usr/share/icons/rstate.png
    eval $(xdotool getmouselocation --shell)
    xdotool mousemove 2 100
    xdotool click 1
    xdotool click 1
    xdotool mousemove $X $Y
    xrefresh

    notify-send -t 1000 '            KDE Plasma Autorotate Enabled' -i /usr/share/icons/rstart.png
    #Start up rotation sensor and rotator
    bash '/usr/bin/Autorotate_rot.sh'  &
    spleep 1
    exit 0
fi

if [ -e $TOGGLE ]; then

    paplay $SNDoff &

    rm $TOGGLE

    #change icon and refresh desktop klicking
    cp /usr/share/icons/rstop.png /usr/share/icons/rstate.png
    eval $(xdotool getmouselocation --shell)
    xdotool mousemove 2 100
    xdotool click 1
    xdotool click 1
    xdotool mousemove $X $Y
    xrefresh

    notify-send -t 1000 '          KDE Plasma Autorotate Disabled' -i /usr/share/icons/rstop.png
    spleep 1
    exit 0
fi


