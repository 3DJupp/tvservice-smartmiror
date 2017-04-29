#!/bin/bash

is_off ()
{
    /opt/vc/bin/tvservice -s | grep "TV is off" >/dev/null
}

if   [ "$1" = "OFF" ]; then
        if ! is_off; then
                /opt/vc/bin/tvservice -o
        fi

elif [ "$1" = "ON" ]; then
        if is_off; then
                /opt/vc/bin/tvservice -p
        fi
elif [ "$1" = "STATUS" ]; then
        if is_off; then
                echo "AUS"
        else
                echo "AN"
        fi
fi