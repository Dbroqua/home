#!/bin/bash

activeconfig='hdmi'

if [ -f ~/.screenlayout.info ] ; then 
    activeconfig=`cat ~/.screenlayout.info`
fi

if [ ${activeconfig} == 'lvds1' ] ; then
    ~/.screenlayout/dp.sh
    echo dp > ~/.screenlayout.info
else 
    ~/.screenlayout/lvds1.sh
    echo lvds1 > ~/.screenlayout.info
fi

fbsetbg -a `tail -n 1 .fluxbox/lastwallpaper|cut -d'|' -f 2`
