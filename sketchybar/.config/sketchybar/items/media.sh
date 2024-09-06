#!/bin/bash

sketchybar --add item media right \
           --set media label.color=$ACCENT_COLOR \
                       label.max_chars=20 \
                       icon.padding_left=0 \
                       icon=􀑪             \
                       icon.color=$ACCENT_COLOR   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
