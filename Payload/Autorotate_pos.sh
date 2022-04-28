#!/bin/bash

##################################################################
#          Autorotate_pos.sh   Calculate position of the pc      #
#              Developed by sergio melas 2021                    #
##################################################################


#Initialize Global Variables
MROT=$HOME/.autorotate/.mrot             #Toggle rotation not done

CUP=$HOME/.autorotate/.cup                #Toggle rotation up
CLEFT=$HOME/.autorotate/.cleft            #Toggle rotation left
CRIGHT=$HOME/.autorotate/.cright          #Toggle rotation right
CDOWN=$HOME/.autorotate/.cdown            #Toggle rotation down

MUP=$HOME/.autorotate/.mup                #Toggle last rotation up
MLEFT=$HOME/.autorotate/.mleft            #Toggle last rotation left
MRIGHT=$HOME/.autorotate/.mright          #Toggle last rotation right
MDOWN=$HOME/.autorotate/.mdown            #Toggle last rotation down

#Avoid first rotation
#rm $MUP
#rm $MLEFT
#rm $MRIGHT
#rm $MDOWN

echo run



#Scan for orientation changes
monitor-sensor | while read line
do


   #Memorize position
   if [[ $line =~ .*left-up.* ]] #If left up
   then

        #manage if rotation necessary
        if [ ! -e $MLEFT ];
        then
           touch $MROT
        else
           rm $MROT
        fi

        #Activate  Left rotation
        rm $CUP
        touch $CLEFT
        rm $CRIGHT
        rm $CDOWN

        echo LEFT
   fi

   if [[ $line =~ .*right-up.* ]] #If right up
   then

        #manage if rotation necessary
        if [ ! -e $MRIGHT ];
        then
           touch $MROT
        else
           rm $MROT
        fi

        #Activate Right rotation
        rm $CUP
        rm $CLEFT
        touch $CRIGHT
        rm $CDOWN


        echo RIGHT
   fi

   if [[ $line =~ .*bottom-up.* ]] #If Bottom up
   then

        #manage if rotation necessary
        if [ ! -e $MDOWN ];
        then
           touch $MROT
        else
           rm $MROT
        fi

        #Activate Up rotation
        rm $CUP
        rm $CLEFT
        rm $CRIGHT
        touch $CDOWN


        echo INVERTED
   fi

   if [[ $line =~ .*normal.* ]] #In normal
   then

        #manage if rotation necessary
        if [ ! -e $MUP ];
        then
           touch $MROT
        else
           rm $MROT
        fi

        #Activate Up rotation
        touch $CUP
        rm $CLEFT
        rm $CRIGHT
        rm $CDOWN

        echo NORMAL
   fi

   sleep 0.5


done
