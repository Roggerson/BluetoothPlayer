# Raspi Bluetooth Music Player for Vehicles
DIY multimedia car radio with touchscreen display, smartphone connectivity and custom 3d printed cases

With this project I want to build my own bluetooth car radio which consists of:
 - Rock Pi 4 ( aka overkill pi)
 - Raspi ups hat v1.0 with 3.7V lipo 
 - A 7" touch Display
 - 3D printed Frame
 - Graphical Music Player Interface 

## Working Features
- Automated startup routine with custom boot sequence (because why not)
- Scanning for devices (scan.sh has to be run manually)
- Clicking on the little cog wheel will list all scanned devices, selecting one will start a pairing routine: Your Phone displays a pin-code, enter this code into the raspi (via a keyboard), btw you only have 10 seconds to enter the pin. If the pin-code is correct paring will be succesfull and the pi automatically connects to your device/phone.
- Music played on your phone will now be streamed to the pi's audio jack.
- Control over the audio via gui, this includes play,pause,skip song, previous song, and volume control
- If your device disconnects the pi will try to reconnect tothe last connected device every 5 seconds

## 3D Printed panel
You can view and download the mount-panel at https://www.thingiverse.com/thing:3171938

## Music Player GUI
![alt text](https://raw.githubusercontent.com/Roggerson/radio/master/tmp/Screenshot.png)

## ToDo
Frame for my car is still WIP


## Know issues
Establishing bluetooth connection may be wonky at times. 
Example: You connect your phone, start playing music, bluetooth connecton quits. If you leave it alone it will automatically reconnect. This however only happens if you connect the first time on startup or if you switch phones.
Worst case: Bluetooth connecting is stuck in a loop where it tires to connect to a devices nonstop. This however can only be fixed by rebooting.

Any kind of feedback,questions and criticism is highly appreciated
If you manage to break it/ find new erros feel free to message me.

## Manual Control via commands
When all hell breaks loose you can run the bash scripts found in /scripts/bash by hand on the command line. Heres a little explanation as to what the scripts do:

**scan.sh**<br />
20second scan to discover devices, list mac and name of device on console and writes them to scannedDevices.txt<br /><br />
**connect.sh xx:xx:xx:xx:xx:xx**<br />
connects to scanned device. replace xx:... with mac of your device<br /><br />
**disconnect.sh**<br />
disconnects device<br /><br />
**checkDevCon.sh**<br />
shows currently connected Device Mac<br /><br />
**audioHwSettings.sh**<br />
by default bluez switches audiosources automatically when a different device connects, carefull though if you run this script more than once or if theres already audio coming from the pi you will hear audio multiple times.<br /><br />
**removeTrusted.sh**<br />
removes all paired,trusted and scannedDevices<br /><br />
**volume.sh** x <br />
sets system volume to X value where X = 0-100 <br /><br />
