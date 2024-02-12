#!/bin/bash

if [ -z "${DISPLAY}" ]; then
    DISPLAY=:0
fi

DISPLAY="$DISPLAY" xrandr --query | awk '/ connected/ {print $1}'
