#!/bin/bash

notify-send --icon=gtk-info Lock "Screen lock in progress..."

#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
/opt/i3lock-fancy-multimonitor/lock
