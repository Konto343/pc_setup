#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
# $(playerctl metadata artist)
    echo "PLAYING: $(playerctl metadata title)" | cut -c 1-30
elif [ "$player_status" = "Paused" ]; then
    echo "PAUSED: $(playerctl metadata title)" | cut -c 1-30
else
    echo "<NO PLAYER>"
fi
