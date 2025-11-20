#!/bin/bash

monitor=$1

if [ "$monitor" -eq 0 ]; then
  hyprctl keyword monitor "eDP-1,preferred,auto,auto"
  #hyprctl keyword monitor "DP-2,disable"
  notify-send "home triggered"
fi

if [ "$monitor" -eq 1 ]; then
  hyprctl keyword monitor "eDP-1,disable"
  hyprctl keyword monitor "DP-2,5120x2160@60,0x0,1.25,bitdepth,10,cm,hdr,sdrbrightness,1.15,sdrsaturation,1.00,vrr,1"
fi
