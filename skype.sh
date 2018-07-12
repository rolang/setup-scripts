#!/bin/bash
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo apt install gconf-service gconf-service-backend gconf2-common libgconf-2-4 -y
sudo dpkg -i skypeforlinux-64.deb
rm skypeforlinux-64.deb
