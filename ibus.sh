#!/usr/bin/env bash

# ibus as workaround for:  https://github.com/Microsoft/vscode/issues/48480

sudo apt install ibus

# remove ctr+shift+e shortcut from the Emoji tab
ibus-setup

# activate ibus as input method
im-config

