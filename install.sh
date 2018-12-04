
#!/bin/bash
#autologin for pi
#sudo raspi-config -> Boot Options -> B1 -> B2


echo "\n-------------------------------------------------\n\tUpdating and Installing Packages\n-------------------------------------------------\n"
sudo apt update && sudo apt upgrade -y
sudo apt install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2 -y
sudo apt install php php-fpm apache2 -y
sudo apt install xserver-xorg-video-all xserver-xorg-input-all xserver-xorg-core xinit x11-xserver-utils -y
sudo apt install chromium-browser unclutter -y
sudo apt install git -y
sudo apt install expect -y
sudo apt install qdbus -y

echo "\n-------------------------------------------------\n\tSetting permissions\n\tChangin Apache2 user to current user\n\tRotating Display 180degrees\n-------------------------------------------------\n"

sudo usermod -a -G bluetooth $USER
sudo usermod -a -G lp $USER
sudo bash -c 'echo "lcd_rotate=2" >> /boot/config.txt'
sudo sed -i "16s/www-data/$USER/" /etc/apache2/envvars
sudo sed -i "17s/www-data/$USER/" /etc/apache2/envvars

sudo chown $USER /var/www/html/

echo "\n-------------------------------------------------\n\tDownloading from git into var/www/html/\n\tCopying xserver init files to home directory of current user\n--------------------------------------------$

git clone https://github.com/Roggerson/BluetoothPlayer.git /var/www/html/BluetoothPlayer
mv /var/www/html/BluetoothPlayer/.xinitrc /home/$USER/
mv /var/www/html/BluetoothPlayer/.profile /home/$USER/

#toDO
#hmmm


#toTry
#/etc/bluetooth/main.conf - Enable=Sink;Media.. blalabal ; necessary?
#same with daemon.conf - resample-method=trivial
#sudo hciconfig hci0 piscan

