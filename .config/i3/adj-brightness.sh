#!/bin/bash

# Check if the argument is for increasing or decreasing brightness
if [ "$1" == "up" ]; then
    brightnessctl set +10%
else
    brightnessctl set 10%-
fi

# Get the current brightness and send a notification
current_brightness=$(brightnessctl -m | cut -d, -f4)
notify-send -t 500 -i display-brightness-symbolic "$current_brightness"
