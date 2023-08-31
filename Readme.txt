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
  -Run the install.sh script (Just drag and drop file the rest is automatic)
  -Reboot
  -Install tablet support for KDE
    sudo apt-get install kde-config-tablet
    Configure:/Settings/Input Devices/Graphic Tablet: Check "Auto-Rotate With Screen" and "Invert Auto-Rotation"
  -Add /usr/bin/Autorotate_clean.sh in the shutdown execution files
    Configure:/Settings/Startup and Shudwn/add logout Scrip and set that file

Update configuration Instructions:

  -Update "Autorotate_conf.sh" configuration file in the Payload sub directory
  -Rerun the install.sh script

Removal Instructions:

  -To unistall run remove.sh

Note: this software works only for Kde Plasma with X11 session

##################################################################################################################
Change log:

V1.0: 2021-12-28
  -Initial version
V1.1: 2022-02-12
  -Added themed icons
V1.2: 2022-03-30
  -Theamed icons are chosen at install
V1.3: 2022-04-14-
  -State memory added
V1.4: 2022-05-30
  -Improved State Memory,
  -Added Global Config
V1.5: 2022-06-20
  -Fully centralized global Config,
  -Improved backlight management,
  -Added some themes
V1.6: 2022-08-20
  -Added timer for rotation confirmation to avoid spurius trasnsitions,
  -Added stereo reverse in upsidedown mode,
  -Better keyboard backlight management,
  -Added interactive dialogue
V1.7: 2022-10-30
  -Added full support for stilus digitizer,
  -Improved Sound Management
V1.8: 2023-01-20
  -Removed icon acess from rclocal
V1.9: 2023-04-25
  -Added forced stop in toggle, added autochange directory in install
V2.0  2023-07-30
  -Added support for plank and pulseaudio
V2.1  2023-08-30-Addesd support for Pipewire and Easy effects,
  -improved sincronization of rotation with hand shake,
  -Removed backlight managenet because nice to have and creating to many bugs
  -Corrected Bug on processes and sleep
  -Added Check for X11 and Kde Plasma at installation
  -Cleaned unused old commented code
