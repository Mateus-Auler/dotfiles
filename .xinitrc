cd

numlockx &

sh $HOME/.local/share/autostart/autostart.sh &

xrdb -load $XDG_CONFIG_HOME/X11/Xresources 

feh --bg-fill $HOME/pics/wallpaper

setxkbmap -option "caps:swapescape"

xmodmap -e "keycode 135 = Super_L" # reassign Menu to Super_L so it works as the modkey

xset r rate 400 50

while xsetroot -name " `amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }'` |  `setxkbmap -query | grep layout | awk '{print $2}'` | `[ $(command -v acpi) ] || acpi | grep 'rate information unavailable' &> /dev/null || $(acpi | grep 'Battery 0' &> /dev/null && echo "  $(acpi | grep -oE '[0-9]{,3}%')$(acpi | grep 'Charging' &> /dev/null && echo ' ⚡') | ")``date +\"%a %d/%m %H:%M\"`"
do
	sleep 1
done &
exec $WM
