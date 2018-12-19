# Raspi Bluetooth Music Player for Vehicles
Work in progress

This is a Bluetooth Music Player that connects to your phone and plays your phones music through the pi. It runs on the Raspberry Pi 3B with the official 7" Display.
For an improved audio experience I used the Hifiberry Amp2.
To make sure the Raspberry powers down smoothly I'm using a psu that switches to battery mode once the car battery doesn provide 12V.
Once your Rapsberry is being powered it boots into Chromium Kiosk mode where the Music Player is being displayed. 

I am using this as a BluetoothPlayer for my car.
If you want to use this player anywhere else, scroll down to

## Getting started
To deploy this project I would recommend that you download the image itself and save it to your SD-Card.

### Installing the software
If you already have a fresh raspbian installed, download and exectue the install-script **install.sh**
```
chmod +x install.sh
./install.sh
```
After that change the default user for login to "pi".
```
sudo raspi-config
```
Then select "Boot Options" -> "B1" -> "B2"
Once everything is installed, reboot your system.
```
sudo reboot
```

### Setting up Hardware
First of all you need the following hardware components:
- [Hifiberry Amp2](https://www.hifiberry.com/shop/boards/hifiberry-amp2/) - Class D Amplifier Capable of 2x30W output power
- Official Raspberry Pi 7" Touchscreen Display
- PSU geekworm ups hat ! you can use it but I am currently working on making a smart one !
- Speaker

### What is this player capable of ?
- Scanning for nearby Bluetooth Devices
- Pairing with pin authentication to scanned devices
- Scanned Devices can be accessed through the cog wheel 
- Audio flow control: play, pause, next song, previous song, changing Volume
- Automatic reconnecting to last connected Bluetooth Device

## 3D Printed panel
If you happen to have a Seat Ibiza 2009 6J or have the same radio panel as my car you can print and mount the Display to it.
You can view and download the mount-panel at https://www.thingiverse.com/thing:3171938

## Music Player GUI
![alt text](https://raw.githubusercontent.com/Roggerson/radio/master/tmp/Screenshot.png)

## Know issues
Establishing bluetooth connection may be wonky at times. 
Gui on the Pi Display is not finished, I recommend a webbrowser access for testing.

Any kind of feedback,questions and criticism is highly appreciated
If you manage to break it/ find new erros feel free to contact me.


## Using it for other purposes
If you want to modify use this, feel free to do so.
The GUI runs on an apache webserver that you can access via a browser. Just connect your pi to a network.
Access via webbrowser:
```
"Ip-Adress of your pi"/BluetoothPlayer/index.php
```

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
