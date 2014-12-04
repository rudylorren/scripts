#!/bin/bash

# Source settings file
. $HOME/bin/dzen_settings.sh

# Modify Settings
Y=$((Y+35))
TITLE="dzen_mpd"

# Source dzen command
. $HOME/bin/command.sh

while :; do

  echo " ^fg($FG)^ca(1,audtool --playback-playpause)^ca(3,audacious)^ca(4,audtool --playlist-reverse)^ca(5,audtool --playlist-advance) \
$(audtool --current-song) ^ca()^ca()^ca()^ca() \
^fg($FG) | \
^fg($FG)^ca(4,amixer set Master 5%+)^ca(5,amixer set Master 5%-) \
$(amixer sget Master | grep -m1 "%]" | cut -d "[" -f2 | cut -d "]" -f1)   ^ca()^ca()"

  sleep $SLEEP & 
done | $DZEN & sleep 0.1s && transset $OPACITY -n $TITLE
