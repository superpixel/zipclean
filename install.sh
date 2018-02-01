#!/bin/bash

DESKTOP_PATH="$HOME/Desktop"

curl -sSO https://raw.githubusercontent.com/superpixel/zipclean/master/zipclean.applescript
osacompile -o "$DESKTOP_PATH/zipclean.app" zipclean.applescript
rm zipclean.applescript
echo "Compiled zipclean.app to your desktop"