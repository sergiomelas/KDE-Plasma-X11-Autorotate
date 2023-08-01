                     ##################################################################
                     ##################################################################
                     ###                   Autorotate for X/KDE                     ###
                     ### Developed by sergio melas (sergiomelas@gmail.com) 2021-23  ###
                     ##################################################################
                     ##################################################################

Installation Instructions:
  -Unzip the file
  -Edit "Autorotate_conf.sh" configuration file in the Payload sub directory, to match the config of your system
  -Open terminal
  -cd in the subdirectory where you unzipped likr in ./KDE_Autorotate
  -Run the install.sh script
  -Reboot
  -Install tablet support for KDE
    sudo apt-get install kde-config-tablet
    Configure:/Settings/Input Devices/Graphic Tablet: Check "Auto-Rotate With Screen" and "Invert Auto-Rotation"

Update configuration Instructions:

  -Update "Autorotate_conf.sh" configuration file in the Payload sub directory
  -Rerun the install.sh script

Removal Instructions:

  -To unistall run remove.sh

Note: this software works only for Kde Plasma with X11 session

##################################################################################################################
Change log:

V1.0: -Initial version
V1.1: -Added themed icons
V1.2: -Theamed icons are chosen at install
V1.3: -State memory added
V1.4: -Improved State Memory,
      -Added Global Config
V1.5: -Fully centralized global Config,
      -Improved backlight management,
      -Added some themes
V1.6: -Added timer for rotation confirmation to avoid spurius trasnsitions,
      -Added stereo reverse in upsidedown mode,
      -Better keyboard backlight management,
      -Added interactive dialogue
V1.7: -Added full support for stilus digitizer,
      -Improved Sound Management
V1.8: -Removed icon acess from rclocal
V1.9: -Added forced stop in toggle, added autochange directory in install
V2.0  -Added support for plank and pulseaudio
V2.1  -Addesd support for Pipewire and Easy effects, improved sincronization of rotation with hand shake, Removed backlight managenet because nice to have and creating to many bugs
