#!/usr/bin/env bash

SKYPE_DEB_PATH=/tmp/skype.deb

curl https://repo.skype.com/latest/skypeforlinux-64.deb -o $SKYPE_DEB_PATH
sudo dpkg -i $SKYPE_DEB_PATH
rm $SKYPE_DEB_PATH
