#!/bin/bash

sudo apt-get update
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install tar -y
sudo apt-get install unzip -y

cd /home/dietpi
wget https://github.com/DonZott/wpi/archive/master.zip
#tar -xzf v0.8.0.tar.gz
unzip master.zip
#mv WavePi-0.8.0 WavePi
mv wpi-master WavePi
cd WavePi

chmod +x ./install.sh
sudo rm /etc/proftpd/proftpd.conf
sudo cp /home/dietpi/WavePi/dietpi/proftpd.conf /etc/proftpd/proftpd.conf
service proftpd restart
sudo usermod -a -G audio dietpi
sudo usermod -a -G i2c dietpi
./install.sh
sudo chown -R dietpi /home/dietpi/WavePi
