/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

exec xset b off &
exec xclip &

exec ~/.scripts/xsetloop &
exec ~/.scripts/monitors &

exec feh --bg-scale ~/.wallpapers/main.jpg &
exec dbus-launch --sh-syntax --exit-with-session dwm 
