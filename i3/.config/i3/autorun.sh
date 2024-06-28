#!/usr/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# picom
run "picom --config ~/.config/picom/picom.conf"

# screen
run "xrandr --output HDMI-A-0 --mode 1920x1080 --rate 100.05"
run "xrandr --output eDP --off"

#keyboard repeat rate
run "xset r rate 200 35"

#nitrogen
run "nitrogen --restore"

#internet
run "nm-applet"

#redshift
run "redshift-gtk"

#volume
run "volumeicon"

# xfce power manager
# run "xfce4-power-manager"
