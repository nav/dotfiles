#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

sleep 1

# Launch top and bottom bar
MONITOR=LVDS-1 polybar -c $HOME/.config/polybar/config top &
#MONITOR=DP-1 polybar -c $HOME/.config/polybar/config top &
MONITOR=HDMI-1 polybar -c $HOME/.config/polybar/config top &

#MONITOR=LVDS-1 polybar -c $HOME/.config/polybar/config bottom &
#MONITOR=DP-1 polybar -c $HOME/.config/polybar/config bottom &

echo "Bars launched..."
