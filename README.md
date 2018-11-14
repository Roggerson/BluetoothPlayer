# radio
DIY multimedia car radio with touchscreen display, smartphone connectivity and custom 3d printed cases
s
With this project I want to build my own bluetooth car radio which consists of:
 - a raspberry pi 3B
 - raspi ups hat v1.0 with 3.7V lipo (to protect raspi from brutal power supply cuts / car ignition turning off)
 - a 7" touch Display
 - self made 3D printed frame
 
In order to achieve bluetooth connection and control my phone via the raspi i wrote a couple of scripts 
that manage these parts
Working at this point:
Scanning for Devices and savind Mac Address and Bluetooth Name
Pairing with a scanned device, during pairing you have to put in a code on the pi that is display on your phone
removing  all paired and trusted devices
Controling audio flow (play,paues,skip,previous,Display Track,Progess of song)
As far as the 3D printing goes
A frame that holds the raspi and fits into my car (Seat ibiza 6J 2009) has been desgined
ToDo
Build graphical interface for user (Some kind of mp3 player), will do this most likely with html,js,...
Add Hooks that hold the frame in place instead of built in car radio
Supplying raspi with car battery
Any kind of feedback,questions and criticism is highly appreciated
