#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    device=$(DISPLAY=:0 xrandr --query | awk '/ connected primary/{print $1; exit}')
else
    device=$1
fi

# Run the command and store the output in the array 'resolutions'
readarray -t resolutions < <(DISPLAY=:0 xrandr --query | awk -v device="$device" '$0~device {p=1; next} p && /^[[:blank:]]/ {print $1; next} p {exit}' | cut -d '_' -f1)

# Display the elements of the 'resolutions' array
for resolution in "${resolutions[@]}"; do
    echo "$resolution"
done
