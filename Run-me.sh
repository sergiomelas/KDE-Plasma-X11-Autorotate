#!/bin/bash
            ##################################################################
            #                         System Update    cccc                  #
            #              Developed by sergio melas  2021-23                #
            ##################################################################

VAR=$0
DIR="$(dirname "${VAR}")"
cd  "${DIR}"

konsole  -e /bin/bash --rcfile <(echo "'./install.sh' ")


