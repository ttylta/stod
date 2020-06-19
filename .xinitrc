#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

. "${HOME}/.cache/wal/colors.sh"

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xsetroot -cursor_name left_ptr
xcalib -d :0 ~/dots/icc/B156HTN03_4_01.icm
wal -R -n
hsetroot -solid "$color9"
catbar

xbindkeys &
picom &
st &
dunst &
blueman-applet &
exec bspwm
