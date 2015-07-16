Streaming from Sony PXW-X70
===========================
Streaming from Sony PXW X70 with ffmpeg. Display, save and forward stream to Youtube

Camera Settings
---------------

requires Firmware 2.0

+ Configure your camera to connect to the same network as your Computer (Network-> Wi-Fi SET -> ...)
+ Go to the Network -> _Streaming_ Menu
+ Configure the Preset, 
  + Set _SIZE_ to 1280x720
  + In  _DESTINATION SET_ enter the IP of your Computer as _Host Name_
    (You can use the Touchscreen)
  + Leave  _Port_ on 1234
+ Set _PRESET SELECT_ to the Preset you just configured
+ Select _EXECUTE_ and choose _Wi-Fi_
+ Press the [THUMBNAIL] button to start sending the stream.

Script Settings
---------------
+ Go to Youtube and prepare your livestream https://www.youtube.com/my_live_events
+ Edit the Script to your liking
  + e.g. Remove logo filter line
  + e.g. remove copy stream line
+ Replace the placeholder with your Youtube stream name
+ Execute the script

Execution on Windows
--------------------
To enable execution of local PowerShell scripts run the following command in a Administrator PowerShell

    set-executionpolicy remotesigned

Start PowerShell, navigate to the folder of the script and execute the script.

    cd .\Downloads
    .\stream_from_pxw_x70.ps1