#!/bin/bash

##################################################################
#      Autorotate_sincro_startup.sh startup application          #
#              Developed by sergio melas 2021                    #
##################################################################

#Toggle rotation on off
TOGGLE=$HOME/.autorotate/.toggle
if [ -e $TOGGLE ]; then
    cp /usr/share/icons/rstart.png /usr/share/icons/rstate.png
else
    cp /usr/share/icons/rstop.png /usr/share/icons/rstate.png
fi

#Start up rotation sensor and rotator
bash '/usr/bin/Autorotate_pos.sh'  &
bash '/usr/bin/Autorotate_rot.sh'  &
