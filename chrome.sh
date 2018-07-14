#!/usr/bin/env bash

CHROME_DEB_PATH=/tmp/gchrome.deb

curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o $CHROME_DEB_PATH
sudo dpkg -i $CHROME_DEB_PATH
rm $CHROME_DEB_PATH
