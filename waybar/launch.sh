# terminate running instances
killall -q waybar

# wait until processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 0.1; done

# launch main
waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css

