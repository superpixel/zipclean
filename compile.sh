#!/bin/bash
BASEDIR=$(dirname "$0")
osacompile -o "$BASEDIR/zipclean.app" "$BASEDIR/zipclean.applescript"
echo "Compiled zipclean.app"